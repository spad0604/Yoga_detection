package com.yogadetection.service;

import com.yogadetection.dto.request.CreateCommentRequest;
import com.yogadetection.dto.request.CreatePostRequest;
import com.yogadetection.dto.response.CommentResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.PostResponse;

public interface GroupPostService {
    PostResponse createPost(String userId, String groupId, CreatePostRequest request, org.springframework.web.multipart.MultipartFile[] images);
    PagedResponse<PostResponse> getGroupFeed(String userId, String groupId, int page, int size);
    void likePost(String userId, String postId);
    void unlikePost(String userId, String postId);
    CommentResponse addComment(String userId, String postId, CreateCommentRequest request);
    PagedResponse<CommentResponse> getComments(String postId, int page, int size);
    void deletePost(String userId, String postId);
}


