package com.yogadetection.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.RoutinePoseResponse;
import com.yogadetection.dto.response.YogaRoutineResponse;
import com.yogadetection.entity.RoutinePose;
import com.yogadetection.entity.UserRoutineProgress;
import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.entity.YogaRoutine;
import com.yogadetection.enums.YogaPoseLevelEnum;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.repository.RoutinePoseRepository;
import com.yogadetection.repository.UserRoutineProgressRepository;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.repository.YogaRoutineRepository;
import com.yogadetection.service.YogaRoutineService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class YogaRoutineServiceImpl implements YogaRoutineService {
    
    private final YogaRoutineRepository yogaRoutineRepository;
    private final RoutinePoseRepository routinePoseRepository;
    private final UserRoutineProgressRepository userRoutineProgressRepository;
    private final YogaPoseDetailsRepository yogaPoseDetailsRepository;
    private final ObjectMapper objectMapper;

    @Override
    public PagedResponse<YogaRoutineResponse> getAllRoutines(int page, int size, String userId) {
        int pageIndex = Math.max(0, page);
        int pageSize = Math.max(1, size);
        Pageable pageable = PageRequest.of(pageIndex, pageSize);
        
        Page<YogaRoutine> routinePage = yogaRoutineRepository.findAllByOrderByOrderIndexAsc(pageable);
        
        List<YogaRoutineResponse> responses = routinePage.getContent().stream()
            .map(routine -> mapToResponse(routine, userId))
            .collect(Collectors.toList());
        
        return PagedResponse.<YogaRoutineResponse>builder()
            .items(responses)
            .page(routinePage.getNumber())
            .pageSize(routinePage.getSize())
            .totalElements(routinePage.getTotalElements())
            .totalPages(routinePage.getTotalPages())
            .hasNext(routinePage.hasNext())
            .hasPrevious(routinePage.hasPrevious())
            .build();
    }

    @Override
    public YogaRoutineResponse getRoutineById(String routineId, String userId) {
        YogaRoutine routine = yogaRoutineRepository.findById(routineId)
            .orElseThrow(() -> new EntityNotFoundException("Routine not found with id: " + routineId));
        
        return mapToDetailedResponse(routine, userId);
    }

    @Override
    public PagedResponse<YogaRoutineResponse> getRoutinesByLevel(YogaPoseLevelEnum level, int page, int size, String userId) {
        int pageIndex = Math.max(0, page);
        int pageSize = Math.max(1, size);
        Pageable pageable = PageRequest.of(pageIndex, pageSize);
        
        Page<YogaRoutine> routinePage = yogaRoutineRepository.findByFilters(level, null, pageable);
        
        List<YogaRoutineResponse> responses = routinePage.getContent().stream()
            .map(routine -> mapToResponse(routine, userId))
            .collect(Collectors.toList());
        
        return PagedResponse.<YogaRoutineResponse>builder()
            .items(responses)
            .page(routinePage.getNumber())
            .pageSize(routinePage.getSize())
            .totalElements(routinePage.getTotalElements())
            .totalPages(routinePage.getTotalPages())
            .hasNext(routinePage.hasNext())
            .hasPrevious(routinePage.hasPrevious())
            .build();
    }

    @Override
    public PagedResponse<YogaRoutineResponse> searchRoutines(String keyword, int page, int size, String userId) {
        int pageIndex = Math.max(0, page);
        int pageSize = Math.max(1, size);
        Pageable pageable = PageRequest.of(pageIndex, pageSize);
        
        Page<YogaRoutine> routinePage = yogaRoutineRepository.searchByKeyword(keyword, pageable);
        
        List<YogaRoutineResponse> responses = routinePage.getContent().stream()
            .map(routine -> mapToResponse(routine, userId))
            .collect(Collectors.toList());
        
        return PagedResponse.<YogaRoutineResponse>builder()
            .items(responses)
            .page(routinePage.getNumber())
            .pageSize(routinePage.getSize())
            .totalElements(routinePage.getTotalElements())
            .totalPages(routinePage.getTotalPages())
            .hasNext(routinePage.hasNext())
            .hasPrevious(routinePage.hasPrevious())
            .build();
    }

    @Override
    public PagedResponse<YogaRoutineResponse> filterRoutines(YogaPoseLevelEnum level, Boolean isPremium, int page, int size, String userId) {
        int pageIndex = Math.max(0, page);
        int pageSize = Math.max(1, size);
        Pageable pageable = PageRequest.of(pageIndex, pageSize);
        
        Page<YogaRoutine> routinePage = yogaRoutineRepository.findByFilters(level, isPremium, pageable);
        
        List<YogaRoutineResponse> responses = routinePage.getContent().stream()
            .map(routine -> mapToResponse(routine, userId))
            .collect(Collectors.toList());
        
        return PagedResponse.<YogaRoutineResponse>builder()
            .items(responses)
            .page(routinePage.getNumber())
            .pageSize(routinePage.getSize())
            .totalElements(routinePage.getTotalElements())
            .totalPages(routinePage.getTotalPages())
            .hasNext(routinePage.hasNext())
            .hasPrevious(routinePage.hasPrevious())
            .build();
    }

    private YogaRoutineResponse mapToResponse(YogaRoutine routine, String userId) {
        List<String> tags = parseTags(routine.getTags());
        Integer totalPoses = routinePoseRepository.countByRoutineId(routine.getId());
        
        YogaRoutineResponse.UserRoutineProgressInfo progressInfo = null;
        if (userId != null) {
            Optional<UserRoutineProgress> progress = userRoutineProgressRepository
                .findByUserIdAndRoutineId(userId, routine.getId());
            
            if (progress.isPresent()) {
                UserRoutineProgress p = progress.get();
                progressInfo = YogaRoutineResponse.UserRoutineProgressInfo.builder()
                    .completionPercentage(p.getCompletionPercentage())
                    .isCompleted(p.getIsCompleted())
                    .currentPoseIndex(p.getCurrentPoseIndex())
                    .lastPracticedAt(p.getLastPracticedAt())
                    .averageScore(p.getAverageScore())
                    .build();
            }
        }
        
        return YogaRoutineResponse.builder()
            .id(routine.getId())
            .name(routine.getName())
            .description(routine.getDescription())
            .level(routine.getLevel())
            .durationMinutes(routine.getDurationMinutes())
            .estimatedCalories(routine.getEstimatedCalories())
            .imageUrl(routine.getImageUrl())
            .tags(tags)
            .isPremium(routine.getIsPremium())
            .totalPoses(totalPoses)
            .createdAt(routine.getCreatedAt())
            .updatedAt(routine.getUpdatedAt())
            .userProgress(progressInfo)
            .build();
    }

    private YogaRoutineResponse mapToDetailedResponse(YogaRoutine routine, String userId) {
        YogaRoutineResponse response = mapToResponse(routine, userId);
        
        // Lấy danh sách poses trong routine
        List<RoutinePose> routinePoses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(routine.getId());
        
        List<RoutinePoseResponse> poseResponses = routinePoses.stream()
            .map(this::mapRoutinePoseToResponse)
            .collect(Collectors.toList());
        
        response.setPoses(poseResponses);
        
        return response;
    }

    private RoutinePoseResponse mapRoutinePoseToResponse(RoutinePose routinePose) {
        RoutinePoseResponse response = RoutinePoseResponse.builder()
            .id(routinePose.getId())
            .poseCode(routinePose.getPoseCode())
            .poseName(routinePose.getPoseName())
            .orderIndex(routinePose.getOrderIndex())
            .durationSeconds(routinePose.getDurationSeconds())
            .repetitions(routinePose.getRepetitions())
            .restAfterSeconds(routinePose.getRestAfterSeconds())
            .instructions(routinePose.getInstructions())
            .build();
        
        // Lấy thêm thông tin pose details
        try {
            YogaPoseDetails poseDetails = yogaPoseDetailsRepository.getYogaPoseDetails(routinePose.getPoseCode());
            if (poseDetails != null) {
                response.setPoseImageUrl(poseDetails.getImageUrl());
                response.setPoseDescription(poseDetails.getDescription());
            }
        } catch (Exception e) {
            // Ignore if pose details not found
        }
        
        return response;
    }

    private List<String> parseTags(String tagsJson) {
        if (tagsJson == null || tagsJson.isEmpty()) {
            return new ArrayList<>();
        }
        
        try {
            return objectMapper.readValue(tagsJson, new TypeReference<List<String>>() {});
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }
}

