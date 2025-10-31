package com.yogadetection.controller;

import com.yogadetection.dto.request.SubmitPoseInSessionRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.PracticeSessionResponse;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.PracticeSessionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/practice-sessions")
public class PracticeSessionController {
    
    private final PracticeSessionService sessionService;
    private final JwtService jwtService;

    /**
     * POST /api/practice-sessions/start - Bắt đầu session tập routine mới
     */
    @PostMapping("/start")
    public ApiResponse<PracticeSessionResponse> startSession(
            @RequestParam String routineId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PracticeSessionResponse response = sessionService.startSession(userId, routineId);
        return ApiResponse.success(response);
    }

    /**
     * GET /api/practice-sessions/{sessionId} - Lấy thông tin session
     */
    @GetMapping("/{sessionId}")
    public ApiResponse<PracticeSessionResponse> getSession(
            @PathVariable String sessionId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PracticeSessionResponse response = sessionService.getSession(userId, sessionId);
        return ApiResponse.success(response);
    }

    /**
     * POST /api/practice-sessions/{sessionId}/submit-pose - Submit ảnh pose và nhận đánh giá từ AI
     * 
     * Form-data:
     * - image: file (MultipartFile)
     * - poseCode: string
     * - timeSpentSeconds: integer
     * - landmarkData: JSON string (PoseLandmarkRequest)
     */
    @PostMapping(value = "/{sessionId}/submit-pose", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ApiResponse<PracticeSessionResponse> submitPose(
            @PathVariable String sessionId,
            @RequestPart(value = "image", required = false) MultipartFile image,
            @RequestParam String poseCode,
            @RequestParam(required = false) Integer timeSpentSeconds,
            @RequestParam(required = false) String landmarkData,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        
        SubmitPoseInSessionRequest request = SubmitPoseInSessionRequest.builder()
            .sessionId(sessionId)
            .poseCode(poseCode)
            .timeSpentSeconds(timeSpentSeconds)
            .build();
        
        // Parse landmark data if provided
        if (landmarkData != null && !landmarkData.isEmpty()) {
            try {
                com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
                com.yogadetection.dto.request.PoseLandmarkRequest landmarks = 
                    mapper.readValue(landmarkData, com.yogadetection.dto.request.PoseLandmarkRequest.class);
                request.setLandmarkData(landmarks);
            } catch (Exception e) {
                log.error("Failed to parse landmark data: {}", e.getMessage());
            }
        }
        
        PracticeSessionResponse response = sessionService.submitPose(userId, sessionId, image, request);
        return ApiResponse.success(response);
    }

    /**
     * POST /api/practice-sessions/{sessionId}/skip - Bỏ qua pose hiện tại
     */
    @PostMapping("/{sessionId}/skip")
    public ApiResponse<PracticeSessionResponse> skipPose(
            @PathVariable String sessionId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PracticeSessionResponse response = sessionService.skipCurrentPose(userId, sessionId);
        return ApiResponse.success(response);
    }

    /**
     * POST /api/practice-sessions/{sessionId}/complete - Hoàn thành session
     */
    @PostMapping("/{sessionId}/complete")
    public ApiResponse<PracticeSessionResponse> completeSession(
            @PathVariable String sessionId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PracticeSessionResponse response = sessionService.completeSession(userId, sessionId);
        return ApiResponse.success(response);
    }

    /**
     * DELETE /api/practice-sessions/{sessionId} - Hủy bỏ session
     */
    @DeleteMapping("/{sessionId}")
    public ApiResponse<String> abandonSession(
            @PathVariable String sessionId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        sessionService.abandonSession(userId, sessionId);
        return ApiResponse.success("Session abandoned successfully");
    }

    /**
     * GET /api/practice-sessions/history - Lấy lịch sử sessions theo khoảng thời gian
     */
    @GetMapping("/history")
    public ApiResponse<java.util.List<PracticeSessionResponse>> getSessionHistory(
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        java.util.List<PracticeSessionResponse> sessions = sessionService.getSessionHistory(userId, startDate, endDate);
        return ApiResponse.success(sessions);
    }

    private String extractUserId(String authHeader) {
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            return jwtService.extractUserId(token);
        }
        throw new IllegalArgumentException("Invalid authorization header");
    }
}
