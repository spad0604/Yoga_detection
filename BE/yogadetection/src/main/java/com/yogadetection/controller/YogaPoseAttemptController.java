package com.yogadetection.controller;

import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.PoseStatisticsResponse;
import com.yogadetection.dto.response.UserStatisticsResponse;
import com.yogadetection.dto.response.YogaPoseAttemptResponse;
import com.yogadetection.entity.User;
import com.yogadetection.entity.YogaPoseAttempt;
import com.yogadetection.service.YogaPoseAttemptService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.OffsetDateTime;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/pose-attempts")
public class YogaPoseAttemptController {
    
    private final YogaPoseAttemptService attemptService;

    /**
     * Tạo attempt mới khi user thực hiện pose
     * Score và feedback sẽ được tự động tạo bởi AI
     * POST /api/pose-attempts
     */
    @PostMapping
    public YogaPoseAttemptResponse createAttempt(
            @AuthenticationPrincipal User user,
            @RequestParam("poseCode") String poseCode,
            @RequestParam(value = "image", required = false) MultipartFile imageFile,
            @RequestPart(value = "landmarkData", required = false) PoseLandmarkRequest landmarkData
    ) {
        YogaPoseAttempt attempt = attemptService.createAttempt(
                user.getId(),
                poseCode,
                imageFile,
                landmarkData,
                null // score sẽ được tạo bởi AI
        );
        
        return mapToResponse(attempt);
    }

    /**
     * Lấy danh sách attempts của user hiện tại
     * GET /api/pose-attempts?page=0&pageSize=10
     */
    @GetMapping
    public PagedResponse<YogaPoseAttemptResponse> getMyAttempts(
            @AuthenticationPrincipal User user,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int pageSize
    ) {
        Page<YogaPoseAttempt> attempts = attemptService.getUserAttempts(
                user.getId(), page, pageSize);
        
        return mapToPagedResponse(attempts);
    }

    /**
     * Lấy attempts theo pose cụ thể
     * GET /api/pose-attempts/by-pose/{poseCode}?page=0&pageSize=10
     */
    @GetMapping("/by-pose/{poseCode}")
    public PagedResponse<YogaPoseAttemptResponse> getAttemptsByPose(
            @AuthenticationPrincipal User user,
            @PathVariable String poseCode,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int pageSize
    ) {
        Page<YogaPoseAttempt> attempts = attemptService.getUserAttemptsByPose(
                user.getId(), poseCode, page, pageSize);
        
        return mapToPagedResponse(attempts);
    }

    /**
     * Lấy attempts trong khoảng thời gian
     * GET /api/pose-attempts/by-date?startDate=2025-01-01T00:00:00Z&endDate=2025-12-31T23:59:59Z
     */
    @GetMapping("/by-date")
    public PagedResponse<YogaPoseAttemptResponse> getAttemptsByDateRange(
            @AuthenticationPrincipal User user,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) OffsetDateTime startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) OffsetDateTime endDate,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int pageSize
    ) {
        Page<YogaPoseAttempt> attempts = attemptService.getUserAttemptsByDateRange(
                user.getId(), startDate, endDate, page, pageSize);
        
        return mapToPagedResponse(attempts);
    }

    /**
     * Lấy chi tiết một attempt
     * GET /api/pose-attempts/{attemptId}
     */
    @GetMapping("/{attemptId}")
    public YogaPoseAttemptResponse getAttemptById(
            @PathVariable String attemptId
    ) {
        YogaPoseAttempt attempt = attemptService.getAttemptById(attemptId);
        return mapToResponse(attempt);
    }

    /**
     * Lấy thống kê tổng quan của user
     * GET /api/pose-attempts/statistics
     */
    @GetMapping("/statistics")
    public UserStatisticsResponse getMyStatistics(
            @AuthenticationPrincipal User user
    ) {
        Map<String, Object> stats = attemptService.getUserStatistics(user.getId());
        
        return UserStatisticsResponse.builder()
                .totalAttempts((Long) stats.get("totalAttempts"))
                .build();
    }

    /**
     * Lấy thống kê cho một pose cụ thể
     * GET /api/pose-attempts/statistics/{poseCode}
     */
    @GetMapping("/statistics/{poseCode}")
    public PoseStatisticsResponse getPoseStatistics(
            @AuthenticationPrincipal User user,
            @PathVariable String poseCode
    ) {
        Map<String, Object> stats = attemptService.getUserPoseStatistics(
                user.getId(), poseCode);
        
        return PoseStatisticsResponse.builder()
                .poseCode(poseCode)
                .totalAttempts((Long) stats.get("totalAttempts"))
                .averageScore((Double) stats.get("averageScore"))
                .highestScore((Double) stats.get("highestScore"))
                .build();
    }

    /**
     * Xóa attempt
     * DELETE /api/pose-attempts/{attemptId}
     */
    @DeleteMapping("/{attemptId}")
    public void deleteAttempt(
            @AuthenticationPrincipal User user,
            @PathVariable String attemptId
    ) {
        attemptService.deleteAttempt(attemptId, user.getId());
    }

    private YogaPoseAttemptResponse mapToResponse(YogaPoseAttempt attempt) {
        return YogaPoseAttemptResponse.builder()
                .id(attempt.getId())
                .poseCode(attempt.getPoseCode())
                .poseName(attempt.getPoseName())
                .imageUrl(attempt.getImageUrl())
                .score(attempt.getScore())
                .feedback(attempt.getFeedback())
                .createdAt(attempt.getCreatedAt())
                .build();
    }

    private PagedResponse<YogaPoseAttemptResponse> mapToPagedResponse(Page<YogaPoseAttempt> page) {
        return PagedResponse.<YogaPoseAttemptResponse>builder()
                .items(page.getContent().stream()
                        .map(this::mapToResponse)
                        .toList())
                .page(page.getNumber())
                .pageSize(page.getSize())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .hasNext(page.hasNext())
                .hasPrevious(page.hasPrevious())
                .build();
    }
}
