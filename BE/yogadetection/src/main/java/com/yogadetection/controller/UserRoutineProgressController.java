package com.yogadetection.controller;

import com.yogadetection.dto.request.UpdateRoutineProgressRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.UserRoutineProgressResponse;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.UserRoutineProgressService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/routines/progress")
public class UserRoutineProgressController {
    
    private final UserRoutineProgressService progressService;
    private final JwtService jwtService;

    /**
     * POST /api/routines/progress/start/{routineId} - Bắt đầu hoặc tiếp tục routine
     */
    @PostMapping("/start/{routineId}")
    public UserRoutineProgressResponse startOrContinueRoutine(
            @PathVariable String routineId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return progressService.startOrContinueRoutine(userId, routineId);
    }

    /**
     * PUT /api/routines/progress/update - Cập nhật tiến độ
     */
    @PutMapping("/update")
    public UserRoutineProgressResponse updateProgress(
            @RequestBody UpdateRoutineProgressRequest request,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return progressService.updateProgress(userId, request);
    }

    /**
     * GET /api/routines/progress/{routineId} - Lấy tiến độ của routine
     */
    @GetMapping("/{routineId}")
    public UserRoutineProgressResponse getProgress(
            @PathVariable String routineId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return progressService.getProgress(userId, routineId);
    }

    /**
     * GET /api/routines/progress/in-progress - Lấy routines đang tập
     */
    @GetMapping("/in-progress")
    public PagedResponse<UserRoutineProgressResponse> getInProgressRoutines(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return progressService.getInProgressRoutines(userId, page, size);
    }

    /**
     * GET /api/routines/progress/completed - Lấy routines đã hoàn thành
     */
    @GetMapping("/completed")
    public PagedResponse<UserRoutineProgressResponse> getCompletedRoutines(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return progressService.getCompletedRoutines(userId, page, size);
    }

    /**
     * DELETE /api/routines/progress/{routineId} - Reset tiến độ
     */
    @DeleteMapping("/{routineId}")
    public ApiResponse<Void> resetProgress(
            @PathVariable String routineId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        progressService.resetProgress(userId, routineId);
        return ApiResponse.defaultResponse();
    }

    /**
     * GET /api/routines/progress/statistics - Lấy thống kê
     */
    @GetMapping("/statistics")
    public UserRoutineProgressService.UserRoutineStatistics getUserStatistics(
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return progressService.getUserStatistics(userId);
    }

    private String extractUserId(String authHeader) {
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            return jwtService.extractUserId(token);
        }
        throw new IllegalArgumentException("Invalid authorization header");
    }
}

