package com.yogadetection.controller;

import com.yogadetection.dto.request.CreateYogaRoutineRequest;
import com.yogadetection.dto.request.UpdateYogaRoutineRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.entity.YogaRoutine;
import com.yogadetection.service.AdminYogaRoutineService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * Admin Controller for managing Yoga Routines
 * Only accessible by users with ADMIN role
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/admin/routines")
@PreAuthorize("hasRole('ADMIN')")
public class AdminYogaRoutineController {
    
    private final AdminYogaRoutineService adminYogaRoutineService;

    /**
     * POST /api/admin/routines - Tạo yoga routine mới
     */
    @PostMapping(consumes = {"multipart/form-data"})
    public ApiResponse<YogaRoutine> createYogaRoutine(
            @RequestPart("name") String name,
            @RequestPart(value = "description", required = false) String description,
            @RequestPart(value = "level", required = false) String level,
            @RequestPart(value = "durationMinutes", required = false) String durationMinutes,
            @RequestPart(value = "estimatedCalories", required = false) String estimatedCalories,
            @RequestPart(value = "tags", required = false) String tags,
            @RequestPart(value = "isPremium", required = false) String isPremium,
            @RequestPart(value = "orderIndex", required = false) String orderIndex,
            @RequestPart(value = "poseIds", required = false) String poseIds,
            @RequestPart(value = "image", required = false) MultipartFile image
    ) {
        CreateYogaRoutineRequest request = CreateYogaRoutineRequest.builder()
                .name(name)
                .description(description)
                .level(level)
                .durationMinutes(durationMinutes != null ? Integer.parseInt(durationMinutes) : null)
                .estimatedCalories(estimatedCalories != null ? Integer.parseInt(estimatedCalories) : null)
                .tags(tags)
                .isPremium(isPremium != null ? Boolean.parseBoolean(isPremium) : false)
                .orderIndex(orderIndex != null ? Integer.parseInt(orderIndex) : null)
                .poseIds(poseIds)
                .image(image)
                .build();
        
        YogaRoutine createdRoutine = adminYogaRoutineService.createYogaRoutine(request);
        return ApiResponse.defaultResponse();
    }

    /**
     * PUT /api/admin/routines/{id} - Cập nhật yoga routine
     */
    @PutMapping(value = "/{id}", consumes = {"multipart/form-data"})
    public ApiResponse<YogaRoutine> updateYogaRoutine(
            @PathVariable String id,
            @RequestPart(value = "name", required = false) String name,
            @RequestPart(value = "description", required = false) String description,
            @RequestPart(value = "level", required = false) String level,
            @RequestPart(value = "durationMinutes", required = false) String durationMinutes,
            @RequestPart(value = "estimatedCalories", required = false) String estimatedCalories,
            @RequestPart(value = "tags", required = false) String tags,
            @RequestPart(value = "isPremium", required = false) String isPremium,
            @RequestPart(value = "orderIndex", required = false) String orderIndex,
            @RequestPart(value = "poseIds", required = false) String poseIds,
            @RequestPart(value = "image", required = false) MultipartFile image
    ) {
        UpdateYogaRoutineRequest request = UpdateYogaRoutineRequest.builder()
                .name(name)
                .description(description)
                .level(level)
                .durationMinutes(durationMinutes != null ? Integer.parseInt(durationMinutes) : null)
                .estimatedCalories(estimatedCalories != null ? Integer.parseInt(estimatedCalories) : null)
                .tags(tags)
                .isPremium(isPremium != null ? Boolean.parseBoolean(isPremium) : null)
                .orderIndex(orderIndex != null ? Integer.parseInt(orderIndex) : null)
                .poseIds(poseIds)
                .image(image)
                .build();
        
        YogaRoutine updatedRoutine = adminYogaRoutineService.updateYogaRoutine(id, request);
        return ApiResponse.defaultResponse();
    }

    /**
     * DELETE /api/admin/routines/{id} - Xóa yoga routine
     */
    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteYogaRoutine(@PathVariable String id) {
        adminYogaRoutineService.deleteYogaRoutine(id);
        return ApiResponse.defaultResponse();
    }

    /**
     * POST /api/admin/routines/{routineId}/poses/{poseId} - Thêm pose vào routine
     */
    @PostMapping("/{routineId}/poses/{poseId}")
    public ApiResponse<YogaRoutine> addPoseToRoutine(
            @PathVariable String routineId,
            @PathVariable String poseId,
            @RequestParam(defaultValue = "0") int orderIndex
    ) {
        YogaRoutine updatedRoutine = adminYogaRoutineService.addPoseToRoutine(routineId, poseId, orderIndex);
        return ApiResponse.defaultResponse();
    }

    /**
     * DELETE /api/admin/routines/{routineId}/poses/{poseId} - Xóa pose khỏi routine
     */
    @DeleteMapping("/{routineId}/poses/{poseId}")
    public ApiResponse<YogaRoutine> removePoseFromRoutine(
            @PathVariable String routineId,
            @PathVariable String poseId
    ) {
        YogaRoutine updatedRoutine = adminYogaRoutineService.removePoseFromRoutine(routineId, poseId);
        return ApiResponse.defaultResponse();
    }
}
