package com.yogadetection.controller;

import com.yogadetection.dto.MultipartFile;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.YogaPoseSummaryResponse;
import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.service.YogaPoseDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/yoga-poses")
public class YogaPoseController {
    private final YogaPoseDetailsService yogaPoseDetailsService;

    @GetMapping
    public PagedResponse<YogaPoseSummaryResponse> list(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int pageSize,
            @RequestParam(required = false) String keyWord
    ) {
        Page<YogaPoseDetails> result = yogaPoseDetailsService.getListYogaPose(page, pageSize, keyWord);
        return PagedResponse.<YogaPoseSummaryResponse>builder()
                .items(result.getContent().stream()
                        .map(y -> YogaPoseSummaryResponse.builder()
                                .id(y.getCode())
                                .name(y.getName())
                                .imageUrl(y.getImageUrl())
                                .minutes(y.getTotalMinutes())
                                .calos(y.getTotalCalos())
                                .build())
                        .toList())
                .page(result.getNumber())
                .pageSize(result.getSize())
                .totalElements(result.getTotalElements())
                .totalPages(result.getTotalPages())
                .hasNext(result.hasNext())
                .hasPrevious(result.hasPrevious())
                .build();
    }

    @GetMapping("/{code}")
    public YogaPoseDetails details(@PathVariable String code) {
        return yogaPoseDetailsService.getYogaPoseDetails(code);
    }
}
