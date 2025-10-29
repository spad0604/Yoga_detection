package com.yogadetection.service.impl;

import com.yogadetection.dto.request.CreateBodyProgressRequest;
import com.yogadetection.dto.request.UpdateBodyProgressRequest;
import com.yogadetection.dto.response.BodyProgressResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.entity.BodyProgress;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.repository.BodyProgressRepository;
import com.yogadetection.service.BodyProgressService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BodyProgressServiceImpl implements BodyProgressService {
    
    private final BodyProgressRepository bodyProgressRepository;
    
    @Override
    @Transactional
    public BodyProgressResponse createBodyProgress(String userId, CreateBodyProgressRequest request) {
        BodyProgress bodyProgress = BodyProgress.builder()
            .userId(userId)
            .weightKg(request.getWeightKg())
            .heightCm(request.getHeightCm())
            .bodyFatPercentage(request.getBodyFatPercentage())
            .muscleMassKg(request.getMuscleMassKg())
            .bodyWaterPercentage(request.getBodyWaterPercentage())
            .chestCm(request.getChestCm())
            .waistCm(request.getWaistCm())
            .hipCm(request.getHipCm())
            .armCm(request.getArmCm())
            .thighCm(request.getThighCm())
            .notes(request.getNotes())
            .photoUrl(request.getPhotoUrl())
            .recordedAt(request.getRecordedAt() != null ? request.getRecordedAt() : OffsetDateTime.now())
            .build();
        
        bodyProgress = bodyProgressRepository.save(bodyProgress);
        return mapToResponse(bodyProgress);
    }
    
    @Override
    @Transactional
    public BodyProgressResponse updateBodyProgress(String userId, String progressId, UpdateBodyProgressRequest request) {
        BodyProgress bodyProgress = bodyProgressRepository.findById(progressId)
            .orElseThrow(() -> new EntityNotFoundException("Body progress not found with id: " + progressId));
        
        // Verify ownership
        if (!bodyProgress.getUserId().equals(userId)) {
            throw new IllegalArgumentException("You don't have permission to update this body progress");
        }
        
        // Update fields
        if (request.getWeightKg() != null) bodyProgress.setWeightKg(request.getWeightKg());
        if (request.getHeightCm() != null) bodyProgress.setHeightCm(request.getHeightCm());
        if (request.getBodyFatPercentage() != null) bodyProgress.setBodyFatPercentage(request.getBodyFatPercentage());
        if (request.getMuscleMassKg() != null) bodyProgress.setMuscleMassKg(request.getMuscleMassKg());
        if (request.getBodyWaterPercentage() != null) bodyProgress.setBodyWaterPercentage(request.getBodyWaterPercentage());
        if (request.getChestCm() != null) bodyProgress.setChestCm(request.getChestCm());
        if (request.getWaistCm() != null) bodyProgress.setWaistCm(request.getWaistCm());
        if (request.getHipCm() != null) bodyProgress.setHipCm(request.getHipCm());
        if (request.getArmCm() != null) bodyProgress.setArmCm(request.getArmCm());
        if (request.getThighCm() != null) bodyProgress.setThighCm(request.getThighCm());
        if (request.getNotes() != null) bodyProgress.setNotes(request.getNotes());
        if (request.getPhotoUrl() != null) bodyProgress.setPhotoUrl(request.getPhotoUrl());
        if (request.getRecordedAt() != null) bodyProgress.setRecordedAt(request.getRecordedAt());
        
        bodyProgress = bodyProgressRepository.save(bodyProgress);
        return mapToResponse(bodyProgress);
    }
    
    @Override
    @Transactional
    public void deleteBodyProgress(String userId, String progressId) {
        BodyProgress bodyProgress = bodyProgressRepository.findById(progressId)
            .orElseThrow(() -> new EntityNotFoundException("Body progress not found with id: " + progressId));
        
        // Verify ownership
        if (!bodyProgress.getUserId().equals(userId)) {
            throw new IllegalArgumentException("You don't have permission to delete this body progress");
        }
        
        bodyProgressRepository.delete(bodyProgress);
    }
    
    @Override
    public BodyProgressResponse getBodyProgressById(String userId, String progressId) {
        BodyProgress bodyProgress = bodyProgressRepository.findById(progressId)
            .orElseThrow(() -> new EntityNotFoundException("Body progress not found with id: " + progressId));
        
        // Verify ownership
        if (!bodyProgress.getUserId().equals(userId)) {
            throw new IllegalArgumentException("You don't have permission to access this body progress");
        }
        
        return mapToResponse(bodyProgress);
    }
    
    @Override
    public PagedResponse<BodyProgressResponse> getUserBodyProgress(String userId, int page, int size) {
        int pageIndex = Math.max(0, page);
        int pageSize = Math.max(1, size);
        Pageable pageable = PageRequest.of(pageIndex, pageSize);
        
        Page<BodyProgress> progressPage = bodyProgressRepository.findByUserIdOrderByRecordedAtDesc(userId, pageable);
        
        List<BodyProgressResponse> responses = progressPage.getContent().stream()
            .map(this::mapToResponse)
            .collect(Collectors.toList());
        
        return PagedResponse.<BodyProgressResponse>builder()
            .items(responses)
            .page(progressPage.getNumber())
            .pageSize(progressPage.getSize())
            .totalElements(progressPage.getTotalElements())
            .totalPages(progressPage.getTotalPages())
            .hasNext(progressPage.hasNext())
            .hasPrevious(progressPage.hasPrevious())
            .build();
    }
    
    @Override
    public List<BodyProgressResponse> getAllUserBodyProgress(String userId) {
        List<BodyProgress> progressList = bodyProgressRepository.findByUserIdOrderByRecordedAtDesc(userId);
        return progressList.stream()
            .map(this::mapToResponse)
            .collect(Collectors.toList());
    }
    
    @Override
    public BodyProgressResponse getLatestBodyProgress(String userId) {
        return bodyProgressRepository.findFirstByUserIdOrderByRecordedAtDesc(userId)
            .map(this::mapToResponse)
            .orElseThrow(() -> new EntityNotFoundException("No body progress found for user: " + userId));
    }
    
    @Override
    public List<BodyProgressResponse> getBodyProgressByDateRange(String userId, OffsetDateTime startDate, OffsetDateTime endDate) {
        List<BodyProgress> progressList = bodyProgressRepository.findByUserIdAndDateRange(userId, startDate, endDate);
        return progressList.stream()
            .map(this::mapToResponse)
            .collect(Collectors.toList());
    }
    
    private BodyProgressResponse mapToResponse(BodyProgress bodyProgress) {
        return BodyProgressResponse.builder()
            .id(bodyProgress.getId())
            .userId(bodyProgress.getUserId())
            .weightKg(bodyProgress.getWeightKg())
            .heightCm(bodyProgress.getHeightCm())
            .bmi(bodyProgress.getBmi())
            .bodyFatPercentage(bodyProgress.getBodyFatPercentage())
            .muscleMassKg(bodyProgress.getMuscleMassKg())
            .bodyWaterPercentage(bodyProgress.getBodyWaterPercentage())
            .chestCm(bodyProgress.getChestCm())
            .waistCm(bodyProgress.getWaistCm())
            .hipCm(bodyProgress.getHipCm())
            .armCm(bodyProgress.getArmCm())
            .thighCm(bodyProgress.getThighCm())
            .notes(bodyProgress.getNotes())
            .photoUrl(bodyProgress.getPhotoUrl())
            .recordedAt(bodyProgress.getRecordedAt())
            .createdAt(bodyProgress.getCreatedAt())
            .updatedAt(bodyProgress.getUpdatedAt())
            .build();
    }
}

