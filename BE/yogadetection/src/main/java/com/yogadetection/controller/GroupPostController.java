package com.yogadetection.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
import com.yogadetection.service.GroupPostService;
import com.yogadetection.service.JwtService;
import com.yogadetection.utils.AuthHeaderUtil;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/social/groups/{groupId}/posts")
public class GroupPostController {

    private final GroupPostService postService;
    private final JwtService jwtService;
    private final AuthHeaderUtil authHeaderUtil;


    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ApiResponse<PostResponse> createPost(
            @PathVariable String groupId,
            @RequestParam("content") String content,
            @RequestParam(value = "images", required = false) org.springframework.web.multipart.MultipartFile[] images,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        CreatePostRequest request = new CreatePostRequest();
        request.setContent(content);
        PostResponse response = postService.createPost(userId, groupId, request, images);
        return ApiResponse.success(response);
    }

    @GetMapping
    public ApiResponse<PagedResponse<PostResponse>> getFeed(
            @PathVariable String groupId,
            @RequestHeader("Authorization") String authHeader,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        PagedResponse<PostResponse> response = postService.getGroupFeed(userId, groupId, page, size);
        return ApiResponse.success(response);
    }

    @PostMapping("/{postId}/likes")
    public ApiResponse<Void> like(
            @PathVariable String groupId,
            @PathVariable String postId,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        postService.likePost(userId, postId);
        return ApiResponse.defaultResponse();
    }

    @PostMapping("/{postId}/unlike")
    public ApiResponse<Void> unlike(
            @PathVariable String groupId,
            @PathVariable String postId,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        postService.unlikePost(userId, postId);
        return ApiResponse.defaultResponse();
    }

    @PostMapping("/{postId}/comments")
    public ApiResponse<CommentResponse> comment(
            @PathVariable String groupId,
            @PathVariable String postId,
            @RequestBody CreateCommentRequest request,
            @RequestHeader("Authorization") String authHeader) {
        String userId = authHeaderUtil.extractUserId(authHeader);
        CommentResponse response = postService.addComment(userId, postId, request);
        return ApiResponse.success(response);
    }

    @GetMapping("/{postId}/comments")
    public ApiResponse<PagedResponse<CommentResponse>> getComments(
            @PathVariable String groupId,
            @PathVariable String postId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        PagedResponse<CommentResponse> response = postService.getComments(postId, page, size);
        return ApiResponse.success(response);
    }
}


