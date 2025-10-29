package com.yogadetection.controller;

import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.YogaRoutineResponse;
import com.yogadetection.enums.YogaPoseLevelEnum;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.YogaRoutineService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/routines")
public class YogaRoutineController {
    
    private final YogaRoutineService yogaRoutineService;
    private final JwtService jwtService;

    /**
     * GET /api/routines - Lấy tất cả routines
     */
    @GetMapping
    public PagedResponse<YogaRoutineResponse> getAllRoutines(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        return yogaRoutineService.getAllRoutines(page, size, userId);
    }

    /**
     * GET /api/routines/{id} - Lấy chi tiết routine
     */
    @GetMapping("/{id}")
    public YogaRoutineResponse getRoutineById(
            @PathVariable String id,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        return yogaRoutineService.getRoutineById(id, userId);
    }

    /**
     * GET /api/routines/level/{level} - Lấy routines theo level
     */
    @GetMapping("/level/{level}")
    public PagedResponse<YogaRoutineResponse> getRoutinesByLevel(
            @PathVariable String level,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        YogaPoseLevelEnum levelEnum = YogaPoseLevelEnum.valueOf(level.toUpperCase());
        return yogaRoutineService.getRoutinesByLevel(levelEnum, page, size, userId);
    }

    /**
     * GET /api/routines/search?keyword=xxx - Tìm kiếm routines
     */
    @GetMapping("/search")
    public PagedResponse<YogaRoutineResponse> searchRoutines(
            @RequestParam String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        return yogaRoutineService.searchRoutines(keyword, page, size, userId);
    }

    /**
     * GET /api/routines/filter - Lọc routines
     */
    @GetMapping("/filter")
    public PagedResponse<YogaRoutineResponse> filterRoutines(
            @RequestParam(required = false) String level,
            @RequestParam(required = false) Boolean isPremium,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestHeader(value = "Authorization", required = false) String authHeader
    ) {
        String userId = extractUserIdFromHeader(authHeader);
        YogaPoseLevelEnum levelEnum = level != null ? YogaPoseLevelEnum.valueOf(level.toUpperCase()) : null;
        return yogaRoutineService.filterRoutines(levelEnum, isPremium, page, size, userId);
    }

    private String extractUserIdFromHeader(String authHeader) {
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            try {
                return jwtService.extractUserId(token);
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }
}

