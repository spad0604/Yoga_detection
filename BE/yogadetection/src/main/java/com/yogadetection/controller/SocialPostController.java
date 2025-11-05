package com.yogadetection.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yogadetection.dto.request.CreateCommentRequest;
import com.yogadetection.dto.request.CreatePostRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.CommentResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.PostResponse;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.SocialPostService;
import com.yogadetection.utils.AuthHeaderUtil;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/social/posts")
public class SocialPostController {

    private final SocialPostService postService;
    private final JwtService jwtService;
    private final AuthHeaderUtil authHeaderUtil;

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ApiResponse<PostResponse> createPost(
            @RequestParam("content") String content,
            @RequestParam(value = "visibility", required = false) String visibility,
            @RequestParam(value = "images", required = false) org.springframework.web.multipart.MultipartFile[] images,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        CreatePostRequest request = new CreatePostRequest();
        request.setContent(content);
        request.setVisibility(visibility);
        PostResponse response = postService.createPost(userId, request, images);
        return ApiResponse.success(response);
    }

    @GetMapping
    public ApiResponse<PagedResponse<PostResponse>> getFeed(
            @RequestHeader("Authorization") String authHeader,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        PagedResponse<PostResponse> response = postService.getFeed(userId, page, size);
        return ApiResponse.success(response);
    }

    @PostMapping("/{postId}/likes")
    public ApiResponse<Void> like(
            @PathVariable String postId,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        postService.likePost(userId, postId);
        return ApiResponse.defaultResponse();
    }

    @PostMapping("/{postId}/unlike")
    public ApiResponse<Void> unlike(
            @PathVariable String postId,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        postService.unlikePost(userId, postId);
        return ApiResponse.defaultResponse();
    }

    @PostMapping("/{postId}/comments")
    public ApiResponse<CommentResponse> comment(
            @PathVariable String postId,
            @RequestBody CreateCommentRequest request,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        CommentResponse response = postService.addComment(userId, postId, request);
        return ApiResponse.success(response);
    }

    @GetMapping("/{postId}/comments")
    public ApiResponse<PagedResponse<CommentResponse>> getComments(
            @PathVariable String postId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        PagedResponse<CommentResponse> response = postService.getComments(postId, page, size);
        return ApiResponse.success(response);
    }

    /**
     * DELETE /api/social/posts/{postId} - Xóa bài viết
     * Chỉ owner của post hoặc ADMIN mới có quyền xóa
     */
    @org.springframework.web.bind.annotation.DeleteMapping("/{postId}")
    public ApiResponse<Void> deletePost(
            @PathVariable String postId,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        postService.deletePost(userId, postId);
        return ApiResponse.defaultResponse();
    }
}


