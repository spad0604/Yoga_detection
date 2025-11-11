package com.yogadetection.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.CreateCommentRequest;
import com.yogadetection.dto.request.CreatePostRequest;
import com.yogadetection.dto.request.NotificationRequest;
import com.yogadetection.dto.response.CommentResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.PostResponse;
import com.yogadetection.entity.Friendship;
import com.yogadetection.entity.SocialPost;
import com.yogadetection.entity.SocialPost.Visibility;
import com.yogadetection.entity.SocialPostComment;
import com.yogadetection.entity.SocialPostLike;
import com.yogadetection.entity.User;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.repository.FriendshipRepository;
import com.yogadetection.repository.SocialPostCommentRepository;
import com.yogadetection.repository.SocialPostLikeRepository;
import com.yogadetection.repository.SocialPostRepository;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.ImageService;
import com.yogadetection.service.NotificationService;
import com.yogadetection.service.SocialPostService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SocialPostServiceImpl implements SocialPostService {

    private final SocialPostRepository postRepository;
    private final SocialPostCommentRepository commentRepository;
    private final SocialPostLikeRepository likeRepository;
    private final FriendshipRepository friendshipRepository;
    private final UserRepository userRepository;
    private final ImageService imageService;
    private final ObjectMapper objectMapper;
    private final NotificationService notificationService;

    @Override
    @Transactional
    public PostResponse createPost(String userId, CreatePostRequest request, MultipartFile[] images) {
        String imageUrlsJson = null;
        try {
            if (images != null && images.length > 0) {
                List<String> urls = new ArrayList<>();
                for (MultipartFile f : images) {
                    if (f != null && !f.isEmpty()) {
                        String url = imageService.uploadImage(f, userId);
                        urls.add(url);
                    }
                }
                imageUrlsJson = objectMapper.writeValueAsString(urls);
            }
        } catch (Exception ex) {
            throw new RuntimeException("Failed to upload images: " + ex.getMessage(), ex);
        }

        Visibility vis = Visibility.PUBLIC;
        if (request.getVisibility() != null) {
            try {
                vis = Visibility.valueOf(request.getVisibility().toUpperCase());
            } catch (Exception ignored) {}
        }

        SocialPost post = SocialPost.builder()
                .authorId(userId)
                .content(request.getContent())
                .imageUrls(imageUrlsJson)
                .visibility(vis)
                .build();
        SocialPost saved = postRepository.save(post);
        return mapToPostResponse(saved, userId);
    }

    @Override
    public PagedResponse<PostResponse> getFeed(String userId, int page, int size, String scope) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        FeedScope feedScope = FeedScope.from(scope);

        Page<SocialPost> posts = Page.empty(pageable);
        switch (feedScope) {
            case PUBLIC -> posts = postRepository.findByVisibilityOrderByCreatedAtDesc(Visibility.PUBLIC, pageable);
            case FRIENDS -> {
                List<String> authorIds = collectFriendAuthorIds(userId, false);
                if (authorIds.isEmpty()) {
                    posts = Page.empty(pageable);
                } else {
                    posts = postRepository.findByAuthorIdInOrderByCreatedAtDesc(authorIds, pageable);
                }
            }
            case ALL -> {
                List<String> authorIds = collectFriendAuthorIds(userId, true);
                posts = postRepository.findByAuthorIdInOrVisibilityOrderByCreatedAtDesc(authorIds, Visibility.PUBLIC, pageable);
            }
        }

        List<PostResponse> items = posts.getContent().stream()
                .map(p -> mapToPostResponse(p, userId))
                .collect(Collectors.toList());
        return PagedResponse.<PostResponse>builder()
                .items(items)
                .page(posts.getNumber())
                .pageSize(posts.getSize())
                .totalElements(posts.getTotalElements())
                .totalPages(posts.getTotalPages())
                .hasNext(posts.hasNext())
                .hasPrevious(posts.hasPrevious())
                .build();
    }

    private List<String> collectFriendAuthorIds(String userId, boolean includeSelf) {
        List<Friendship> friendships = friendshipRepository.findAllByUserIdAndStatus(
                userId,
                Friendship.FriendshipStatus.ACCEPTED
        );
        List<String> authorIds = friendships.stream()
                .map(f -> f.getUserId().equals(userId) ? f.getFriendId() : f.getUserId())
                .collect(Collectors.toCollection(java.util.ArrayList::new));
        if (includeSelf) {
            authorIds.add(userId);
        }
        return authorIds;
    }

    private enum FeedScope {
        PUBLIC,
        FRIENDS,
        ALL;

        static FeedScope from(String value) {
            if (value == null || value.isBlank()) {
                return PUBLIC;
            }
            try {
                return FeedScope.valueOf(value.toUpperCase());
            } catch (IllegalArgumentException ex) {
                return PUBLIC;
            }
        }
    }

    @Override
    @Transactional
    public void likePost(String userId, String postId) {
        SocialPost post = postRepository.findById(postId)
                .orElseThrow(() -> new EntityNotFoundException("Post not found"));
        if (likeRepository.findByPostIdAndUserId(postId, userId).isPresent()) {
            return;
        }
        SocialPostLike like = SocialPostLike.builder()
                .postId(postId)
                .userId(userId)
                .build();

        userRepository.findById(userId).ifPresent(requester -> {
            NotificationRequest notificationRequest = new NotificationRequest();
            notificationRequest.setAll(false);
            notificationRequest.setUserId(post.getAuthorId());
            String title = requester.getLastName() != null ? requester.getLastName() : requester.getEmail();
            notificationRequest.setNormalTitle(title + " đã thích bài viết của bạn");
            notificationRequest.setHtmlTitle(null);
            notificationRequest.setHtmlTitle(null);

            if(!Objects.equals(requester.getUsername(), post.getAuthorId())){
                notificationService.pushNotificationToUser(post.getAuthorId(), notificationRequest);
            }
        });
        likeRepository.save(like);
        post.setLikeCount((post.getLikeCount() == null ? 0 : post.getLikeCount()) + 1);
        postRepository.save(post);
    }

    @Override
    @Transactional
    public void unlikePost(String userId, String postId) {
        SocialPost post = postRepository.findById(postId)
                .orElseThrow(() -> new EntityNotFoundException("Post not found"));
        likeRepository.findByPostIdAndUserId(postId, userId).ifPresent(l -> {
            likeRepository.delete(l);
            int current = post.getLikeCount() == null ? 0 : post.getLikeCount();
            post.setLikeCount(Math.max(0, current - 1));
            postRepository.save(post);
        });
    }

    @Override
    @Transactional
    public CommentResponse addComment(String userId, String postId, CreateCommentRequest request) {
        SocialPost post = postRepository.findById(postId)
                .orElseThrow(() -> new EntityNotFoundException("Post not found"));
        SocialPostComment c = SocialPostComment.builder()
                .postId(postId)
                .userId(userId)
                .content(request.getContent())
                .build();
        SocialPostComment saved = commentRepository.save(c);
        post.setCommentCount((post.getCommentCount() == null ? 0 : post.getCommentCount()) + 1);

        userRepository.findById(userId).ifPresent(requester -> {
            NotificationRequest notificationRequest = new NotificationRequest();
            notificationRequest.setAll(false);
            notificationRequest.setUserId(post.getAuthorId());
            String title = requester.getLastName() != null ? requester.getLastName() : requester.getEmail();
            notificationRequest.setNormalTitle(title + " đã bình luận về bài viết của bạn");
            notificationRequest.setHtmlTitle(null);
            notificationRequest.setImageUrl(null);

            if(!Objects.equals(requester.getUsername(), post.getAuthorId())) {
                notificationService.pushNotificationToUser(post.getAuthorId(), notificationRequest);
            }
        });

        postRepository.save(post);
        return mapToCommentResponse(saved);
    }

    @Override
    public PagedResponse<CommentResponse> getComments(String postId, int page, int size) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<com.yogadetection.entity.SocialPostComment> comments = commentRepository.findByPostIdOrderByCreatedAtDesc(postId, pageable);
        List<CommentResponse> items = comments.getContent().stream()
                .map(this::mapToCommentResponse)
                .collect(Collectors.toList());

        return PagedResponse.<CommentResponse>builder()
                .items(items)
                .page(comments.getNumber())
                .pageSize(comments.getSize())
                .totalElements(comments.getTotalElements())
                .totalPages(comments.getTotalPages())
                .hasNext(comments.hasNext())
                .hasPrevious(comments.hasPrevious())
                .build();
    }

    private PostResponse mapToPostResponse(SocialPost post, String currentUserId) {
        User author = userRepository.findById(post.getAuthorId()).orElse(null);
        boolean likedByMe = likeRepository.findByPostIdAndUserId(post.getId(), currentUserId).isPresent();
        return PostResponse.builder()
                .id(post.getId())
                .groupId(null)
                .authorId(post.getAuthorId())
                .authorName(author != null ? author.getUsername() : "Unknown")
                .content(post.getContent())
                .imageUrls(post.getImageUrls())
                .likeCount(post.getLikeCount())
                .commentCount(post.getCommentCount())
                .likedByMe(likedByMe)
                .createdAt(post.getCreatedAt())
                .build();
    }

    private CommentResponse mapToCommentResponse(SocialPostComment c) {
        User u = userRepository.findById(c.getUserId()).orElse(null);
        return CommentResponse.builder()
                .id(c.getId())
                .postId(c.getPostId())
                .userId(c.getUserId())
                .username(u != null ? u.getUsername() : "Unknown")
                .content(c.getContent())
                .createdAt(c.getCreatedAt())
                .build();
    }

    @Override
    @Transactional
    public void deletePost(String userId, String postId) {
        SocialPost post = postRepository.findById(postId)
                .orElseThrow(() -> new EntityNotFoundException("Post not found"));
        
        // Check permission: only owner or admin can delete
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new EntityNotFoundException("User not found"));
        
        boolean isOwner = post.getAuthorId().equals(userId);
        boolean isAdmin = user.getUserRole().name().equals("ADMIN");
        
        if (!isOwner && !isAdmin) {
            throw new SecurityException("You don't have permission to delete this post");
        }
        
        // Delete all related data
        likeRepository.deleteByPostId(postId);
        commentRepository.deleteByPostId(postId);
        postRepository.delete(post);
    }
}


