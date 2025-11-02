package com.yogadetection.controller;

import com.yogadetection.dto.request.CreateYogaPoseRequest;
import com.yogadetection.dto.request.UpdateYogaPoseRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.service.AdminYogaPoseService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * Admin Controller for managing Yoga Poses
 * Only accessible by users with ADMIN role
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/admin/yoga-poses")
@PreAuthorize("hasRole('ADMIN')")
public class AdminYogaPoseController {
    
    private final AdminYogaPoseService adminYogaPoseService;

    /**
     * POST /api/admin/yoga-poses - Tạo yoga pose mới
     */
    @PostMapping(consumes = {"multipart/form-data"})
    public ApiResponse<YogaPoseDetails> createYogaPose(
            @RequestPart("name") String name,
            @RequestPart("totalMinutes") String totalMinutes,
            @RequestPart("totalCalos") String totalCalos,
            @RequestPart("level") String level,
            @RequestPart(value = "description", required = false) String description,
            @RequestPart(value = "image", required = false) MultipartFile image
    ) {
        CreateYogaPoseRequest request = CreateYogaPoseRequest.builder()
                .name(name)
                .totalMinutes(Integer.parseInt(totalMinutes))
                .totalCalos(Integer.parseInt(totalCalos))
                .level(level)
                .description(description)
                .image(image)
                .build();
        
        YogaPoseDetails createdPose = adminYogaPoseService.createYogaPose(request);
        return ApiResponse.<YogaPoseDetails>builder()
                .status(201)
                .message("Tạo yoga pose thành công")
                .data(createdPose)
                .build();
    }

    /**
     * PUT /api/admin/yoga-poses/{code} - Cập nhật yoga pose
     */
    @PutMapping(value = "/{code}", consumes = {"multipart/form-data"})
    public ApiResponse<YogaPoseDetails> updateYogaPose(
            @PathVariable String code,
            @RequestPart(value = "name", required = false) String name,
            @RequestPart(value = "totalMinutes", required = false) String totalMinutes,
            @RequestPart(value = "totalCalos", required = false) String totalCalos,
            @RequestPart(value = "level", required = false) String level,
            @RequestPart(value = "description", required = false) String description,
            @RequestPart(value = "image", required = false) MultipartFile image
    ) {
        UpdateYogaPoseRequest request = UpdateYogaPoseRequest.builder()
                .name(name)
                .totalMinutes(totalMinutes != null ? Integer.parseInt(totalMinutes) : null)
                .totalCalos(totalCalos != null ? Integer.parseInt(totalCalos) : null)
                .level(level)
                .description(description)
                .image(image)
                .build();
        
        YogaPoseDetails updatedPose = adminYogaPoseService.updateYogaPose(code, request);
        return ApiResponse.<YogaPoseDetails>builder()
                .status(200)
                .message("Cập nhật yoga pose thành công")
                .data(updatedPose)
                .build();
    }

    /**
     * DELETE /api/admin/yoga-poses/{code} - Xóa yoga pose
     */
    @DeleteMapping("/{code}")
    public ApiResponse<Void> deleteYogaPose(@PathVariable String code) {
        adminYogaPoseService.deleteYogaPose(code);
        return ApiResponse.<Void>builder()
                .status(200)
                .message("Xóa yoga pose thành công")
                .build();
    }
}
