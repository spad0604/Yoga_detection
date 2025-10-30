package com.yogadetection.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yogadetection.dto.request.CreateCommentRequest;
import com.yogadetection.dto.request.CreatePostRequest;
import com.yogadetection.dto.response.CommentResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.PostResponse;
import com.yogadetection.entity.GroupMember;
import com.yogadetection.entity.GroupPost;
import com.yogadetection.entity.GroupPostComment;
import com.yogadetection.entity.GroupPostLike;
import com.yogadetection.entity.User;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.repository.GroupMemberRepository;
import com.yogadetection.repository.GroupPostCommentRepository;
import com.yogadetection.repository.GroupPostLikeRepository;
import com.yogadetection.repository.GroupPostRepository;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.GroupPostService;
import com.yogadetection.service.ImageService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GroupPostServiceImpl implements GroupPostService {

    private final GroupPostRepository postRepository;
    private final GroupPostCommentRepository commentRepository;
    private final GroupPostLikeRepository likeRepository;
    private final GroupMemberRepository groupMemberRepository;
    private final UserRepository userRepository;
    private final ImageService imageService;
    private final ObjectMapper objectMapper;

    private void ensureMember(String userId, String groupId) {
        if (!groupMemberRepository.isMember(groupId, userId)) {
            throw new IllegalArgumentException("You are not a member of this group");
        }
    }

    @Override
    @Transactional
    public PostResponse createPost(String userId, String groupId, CreatePostRequest request, org.springframework.web.multipart.MultipartFile[] images) {
        ensureMember(userId, groupId);

        String imageUrlsJson = null;
        try {
            if (images != null && images.length > 0) {
                java.util.List<String> urls = new java.util.ArrayList<>();
                for (org.springframework.web.multipart.MultipartFile f : images) {
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

        GroupPost post = GroupPost.builder()
                .groupId(groupId)
                .authorId(userId)
                .content(request.getContent())
                .imageUrls(imageUrlsJson)
                .build();
        GroupPost saved = postRepository.save(post);
        return mapToPostResponse(saved, userId);
    }

    @Override
    public PagedResponse<PostResponse> getGroupFeed(String userId, String groupId, int page, int size) {
        ensureMember(userId, groupId);
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<GroupPost> posts = postRepository.findByGroupId(groupId, pageable);
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

    @Override
    @Transactional
    public void likePost(String userId, String postId) {
        GroupPost post = postRepository.findById(postId)
                .orElseThrow(() -> new EntityNotFoundException("Post not found"));
        ensureMember(userId, post.getGroupId());
        if (likeRepository.findByPostIdAndUserId(postId, userId).isPresent()) {
            return;
        }
        GroupPostLike like = GroupPostLike.builder()
                .postId(postId)
                .userId(userId)
                .build();
        likeRepository.save(like);
        post.setLikeCount((post.getLikeCount() == null ? 0 : post.getLikeCount()) + 1);
        postRepository.save(post);
    }

    @Override
    @Transactional
    public void unlikePost(String userId, String postId) {
        GroupPost post = postRepository.findById(postId)
                .orElseThrow(() -> new EntityNotFoundException("Post not found"));
        ensureMember(userId, post.getGroupId());
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
        GroupPost post = postRepository.findById(postId)
                .orElseThrow(() -> new EntityNotFoundException("Post not found"));
        ensureMember(userId, post.getGroupId());
        GroupPostComment c = GroupPostComment.builder()
                .postId(postId)
                .userId(userId)
                .content(request.getContent())
                .build();
        GroupPostComment saved = commentRepository.save(c);
        post.setCommentCount((post.getCommentCount() == null ? 0 : post.getCommentCount()) + 1);
        postRepository.save(post);
        return mapToCommentResponse(saved);
    }

    @Override
    public PagedResponse<CommentResponse> getComments(String postId, int page, int size) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<GroupPostComment> comments = commentRepository.findByPostId(postId, pageable);
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

    private PostResponse mapToPostResponse(GroupPost post, String currentUserId) {
        User author = userRepository.findById(post.getAuthorId()).orElse(null);
        boolean likedByMe = likeRepository.findByPostIdAndUserId(post.getId(), currentUserId).isPresent();
        return PostResponse.builder()
                .id(post.getId())
                .groupId(post.getGroupId())
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

    private CommentResponse mapToCommentResponse(GroupPostComment c) {
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
}


