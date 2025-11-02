package com.yogadetection.service.impl;

import com.yogadetection.dto.request.CreateYogaPoseRequest;
import com.yogadetection.dto.request.UpdateYogaPoseRequest;
import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.enums.YogaPoseLevelEnum;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.service.AdminYogaPoseService;
import com.yogadetection.service.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdminYogaPoseServiceImpl implements AdminYogaPoseService {
    
    private final YogaPoseDetailsRepository yogaPoseDetailsRepository;
    private final ImageService imageService;

    @Override
    @Transactional
    public YogaPoseDetails createYogaPose(CreateYogaPoseRequest request) {
        log.info("Creating new yoga pose: {}", request.getName());
        
        // Validate level
        YogaPoseLevelEnum level;
        try {
            level = YogaPoseLevelEnum.valueOf(request.getLevel().toUpperCase());
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid level: " + request.getLevel() + ". Must be BEGINNER, INTERMEDIATE, or ADVANCED");
        }
        
        // Upload image if provided
        String imageUrl = null;
        if (request.getImage() != null && !request.getImage().isEmpty()) {
            imageUrl = imageService.uploadImage(request.getImage(), "admin");
        }
        
        // Create yoga pose
        YogaPoseDetails yogaPose = new YogaPoseDetails();
        yogaPose.setName(request.getName());
        yogaPose.setTotalMinutes(request.getTotalMinutes());
        yogaPose.setTotalCalos(request.getTotalCalos());
        yogaPose.setLevel(level);
        yogaPose.setDescription(request.getDescription());
        yogaPose.setImageUrl(imageUrl);
        
        YogaPoseDetails savedPose = yogaPoseDetailsRepository.save(yogaPose);
        log.info("Created yoga pose with code: {}", savedPose.getCode());
        
        return savedPose;
    }

    @Override
    @Transactional
    public YogaPoseDetails updateYogaPose(String code, UpdateYogaPoseRequest request) {
        log.info("Updating yoga pose: {}", code);
        
        // Find existing pose
        YogaPoseDetails existingPose = yogaPoseDetailsRepository.findById(code)
                .orElseThrow(() -> new IllegalArgumentException("Yoga pose not found with code: " + code));
        
        // Update fields if provided
        if (request.getName() != null) {
            existingPose.setName(request.getName());
        }
        
        if (request.getTotalMinutes() != null) {
            existingPose.setTotalMinutes(request.getTotalMinutes());
        }
        
        if (request.getTotalCalos() != null) {
            existingPose.setTotalCalos(request.getTotalCalos());
        }
        
        if (request.getLevel() != null) {
            try {
                YogaPoseLevelEnum level = YogaPoseLevelEnum.valueOf(request.getLevel().toUpperCase());
                existingPose.setLevel(level);
            } catch (Exception e) {
                throw new IllegalArgumentException("Invalid level: " + request.getLevel());
            }
        }
        
        if (request.getDescription() != null) {
            existingPose.setDescription(request.getDescription());
        }
        
        // Upload new image if provided
        if (request.getImage() != null && !request.getImage().isEmpty()) {
            String newImageUrl = imageService.uploadImage(request.getImage(), "admin");
            existingPose.setImageUrl(newImageUrl);
        }
        
        YogaPoseDetails updatedPose = yogaPoseDetailsRepository.save(existingPose);
        log.info("Updated yoga pose: {}", code);
        
        return updatedPose;
    }

    @Override
    @Transactional
    public void deleteYogaPose(String code) {
        log.info("Deleting yoga pose: {}", code);
        
        if (!yogaPoseDetailsRepository.existsById(code)) {
            throw new IllegalArgumentException("Yoga pose not found with code: " + code);
        }
        
        yogaPoseDetailsRepository.deleteById(code);
        log.info("Deleted yoga pose: {}", code);
    }
}
