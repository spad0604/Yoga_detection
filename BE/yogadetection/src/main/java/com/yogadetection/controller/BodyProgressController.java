package com.yogadetection.controller;

import com.yogadetection.dto.request.CreateBodyProgressRequest;
import com.yogadetection.dto.request.UpdateBodyProgressRequest;
import com.yogadetection.dto.response.BodyProgressResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.service.BodyProgressService;
import com.yogadetection.service.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.OffsetDateTime;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/body-progress")
public class BodyProgressController {
    
    private final BodyProgressService bodyProgressService;
    private final JwtService jwtService;
    
    /**
     * POST /api/body-progress - Tạo mới body progress record
     */
    @PostMapping
    public ResponseEntity<BodyProgressResponse> createBodyProgress(
            @RequestBody CreateBodyProgressRequest request,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        BodyProgressResponse response = bodyProgressService.createBodyProgress(userId, request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
    
    /**
     * PUT /api/body-progress/{id} - Cập nhật body progress record
     */
    @PutMapping("/{id}")
    public ResponseEntity<BodyProgressResponse> updateBodyProgress(
            @PathVariable String id,
            @RequestBody UpdateBodyProgressRequest request,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        BodyProgressResponse response = bodyProgressService.updateBodyProgress(userId, id, request);
        return ResponseEntity.ok(response);
    }
    
    /**
     * DELETE /api/body-progress/{id} - Xóa body progress record
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBodyProgress(
            @PathVariable String id,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        bodyProgressService.deleteBodyProgress(userId, id);
        return ResponseEntity.noContent().build();
    }
    
    /**
     * GET /api/body-progress/{id} - Lấy chi tiết body progress record
     */
    @GetMapping("/{id}")
    public ResponseEntity<BodyProgressResponse> getBodyProgressById(
            @PathVariable String id,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        BodyProgressResponse response = bodyProgressService.getBodyProgressById(userId, id);
        return ResponseEntity.ok(response);
    }
    
    /**
     * GET /api/body-progress - Lấy danh sách body progress records của user với phân trang
     */
    @GetMapping
    public ResponseEntity<PagedResponse<BodyProgressResponse>> getUserBodyProgress(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        PagedResponse<BodyProgressResponse> response = bodyProgressService.getUserBodyProgress(userId, page, size);
        return ResponseEntity.ok(response);
    }
    
    /**
     * GET /api/body-progress/all - Lấy tất cả body progress records của user
     */
    @GetMapping("/all")
    public ResponseEntity<List<BodyProgressResponse>> getAllUserBodyProgress(
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        List<BodyProgressResponse> response = bodyProgressService.getAllUserBodyProgress(userId);
        return ResponseEntity.ok(response);
    }
    
    /**
     * GET /api/body-progress/latest - Lấy body progress record mới nhất của user
     */
    @GetMapping("/latest")
    public ResponseEntity<BodyProgressResponse> getLatestBodyProgress(
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        BodyProgressResponse response = bodyProgressService.getLatestBodyProgress(userId);
        return ResponseEntity.ok(response);
    }
    
    /**
     * GET /api/body-progress/range - Lấy body progress records trong khoảng thời gian
     */
    @GetMapping("/range")
    public ResponseEntity<List<BodyProgressResponse>> getBodyProgressByDateRange(
            @RequestParam OffsetDateTime startDate,
            @RequestParam OffsetDateTime endDate,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        List<BodyProgressResponse> response = bodyProgressService.getBodyProgressByDateRange(userId, startDate, endDate);
        return ResponseEntity.ok(response);
    }
    
    private String extractUserIdFromHeader(String authHeader) {
        return jwtService.extractUserId(authHeader);
    }
}

