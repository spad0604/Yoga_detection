package com.yogadetection.service;

import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import com.yogadetection.dto.request.CreateCommentRequest;
import com.yogadetection.dto.request.CreatePostRequest;
import com.yogadetection.dto.response.CommentResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.PostResponse;

public interface SocialPostService {
    PostResponse createPost(String userId, CreatePostRequest request, MultipartFile[] images);
    PagedResponse<PostResponse> getFeed(String userId, int page, int size);
    void likePost(String userId, String postId);
    void unlikePost(String userId, String postId);
    CommentResponse addComment(String userId, String postId, CreateCommentRequest request);
    PagedResponse<CommentResponse> getComments(String postId, int page, int size);
}


