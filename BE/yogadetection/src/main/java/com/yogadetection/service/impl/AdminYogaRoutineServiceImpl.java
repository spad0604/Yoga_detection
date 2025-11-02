package com.yogadetection.service.impl;

import com.yogadetection.dto.request.CreateYogaRoutineRequest;
import com.yogadetection.dto.request.UpdateYogaRoutineRequest;
import com.yogadetection.entity.RoutinePose;
import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.entity.YogaRoutine;
import com.yogadetection.enums.YogaPoseLevelEnum;
import com.yogadetection.repository.RoutinePoseRepository;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.repository.YogaRoutineRepository;
import com.yogadetection.service.AdminYogaRoutineService;
import com.yogadetection.service.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdminYogaRoutineServiceImpl implements AdminYogaRoutineService {
    
    private final YogaRoutineRepository yogaRoutineRepository;
    private final YogaPoseDetailsRepository yogaPoseDetailsRepository;
    private final RoutinePoseRepository routinePoseRepository;
    private final ImageService imageService;

    @Override
    @Transactional
    public YogaRoutine createYogaRoutine(CreateYogaRoutineRequest request) {
        log.info("Creating new yoga routine: {}", request.getName());
        
        // Validate level if provided
        YogaPoseLevelEnum level = null;
        if (request.getLevel() != null) {
            try {
                level = YogaPoseLevelEnum.valueOf(request.getLevel().toUpperCase());
            } catch (Exception e) {
                throw new IllegalArgumentException("Invalid level: " + request.getLevel());
            }
        }
        
        // Upload image if provided
        String imageUrl = null;
        if (request.getImage() != null && !request.getImage().isEmpty()) {
            imageUrl = imageService.uploadImage(request.getImage(), "admin");
        }
        
        // Create routine
        YogaRoutine routine = YogaRoutine.builder()
                .name(request.getName())
                .description(request.getDescription())
                .level(level)
                .durationMinutes(request.getDurationMinutes())
                .estimatedCalories(request.getEstimatedCalories())
                .tags(request.getTags())
                .isPremium(request.getIsPremium() != null ? request.getIsPremium() : false)
                .orderIndex(request.getOrderIndex())
                .imageUrl(imageUrl)
                .build();
        
        YogaRoutine savedRoutine = yogaRoutineRepository.save(routine);
        
        // Add poses if provided
        if (request.getPoseIds() != null && !request.getPoseIds().isEmpty()) {
            String[] poseIds = request.getPoseIds().split(",");
            List<RoutinePose> routinePoses = new ArrayList<>();
            
            for (int i = 0; i < poseIds.length; i++) {
                String poseId = poseIds[i].trim();
                YogaPoseDetails pose = yogaPoseDetailsRepository.findById(poseId)
                        .orElseThrow(() -> new IllegalArgumentException("Pose not found: " + poseId));
                
                RoutinePose routinePose = RoutinePose.builder()
                        .routine(savedRoutine)
                        .poseCode(pose.getCode())
                        .poseName(pose.getName())
                        .orderIndex(i)
                        .durationSeconds(60) // Default 60 seconds
                        .repetitions(1)
                        .restAfterSeconds(5)
                        .build();
                
                routinePoses.add(routinePose);
            }
            
            routinePoseRepository.saveAll(routinePoses);
            savedRoutine.setPoses(routinePoses);
        }
        
        log.info("Created yoga routine with ID: {}", savedRoutine.getId());
        return savedRoutine;
    }

    @Override
    @Transactional
    public YogaRoutine updateYogaRoutine(String id, UpdateYogaRoutineRequest request) {
        log.info("Updating yoga routine: {}", id);
        
        // Find existing routine
        YogaRoutine existingRoutine = yogaRoutineRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Routine not found with ID: " + id));
        
        // Update fields if provided
        if (request.getName() != null) {
            existingRoutine.setName(request.getName());
        }
        
        if (request.getDescription() != null) {
            existingRoutine.setDescription(request.getDescription());
        }
        
        if (request.getLevel() != null) {
            try {
                YogaPoseLevelEnum level = YogaPoseLevelEnum.valueOf(request.getLevel().toUpperCase());
                existingRoutine.setLevel(level);
            } catch (Exception e) {
                throw new IllegalArgumentException("Invalid level: " + request.getLevel());
            }
        }
        
        if (request.getDurationMinutes() != null) {
            existingRoutine.setDurationMinutes(request.getDurationMinutes());
        }
        
        if (request.getEstimatedCalories() != null) {
            existingRoutine.setEstimatedCalories(request.getEstimatedCalories());
        }
        
        if (request.getTags() != null) {
            existingRoutine.setTags(request.getTags());
        }
        
        if (request.getIsPremium() != null) {
            existingRoutine.setIsPremium(request.getIsPremium());
        }
        
        if (request.getOrderIndex() != null) {
            existingRoutine.setOrderIndex(request.getOrderIndex());
        }
        
        // Upload new image if provided
        if (request.getImage() != null && !request.getImage().isEmpty()) {
            String newImageUrl = imageService.uploadImage(request.getImage(), "admin");
            existingRoutine.setImageUrl(newImageUrl);
        }
        
        // Update poses if provided
        if (request.getPoseIds() != null && !request.getPoseIds().isEmpty()) {
            // Delete existing poses
            routinePoseRepository.deleteByRoutineId(id);
            
            // Add new poses
            String[] poseIds = request.getPoseIds().split(",");
            List<RoutinePose> routinePoses = new ArrayList<>();
            
            for (int i = 0; i < poseIds.length; i++) {
                String poseId = poseIds[i].trim();
                YogaPoseDetails pose = yogaPoseDetailsRepository.findById(poseId)
                        .orElseThrow(() -> new IllegalArgumentException("Pose not found: " + poseId));
                
                RoutinePose routinePose = RoutinePose.builder()
                        .routine(existingRoutine)
                        .poseCode(pose.getCode())
                        .poseName(pose.getName())
                        .orderIndex(i)
                        .durationSeconds(60)
                        .repetitions(1)
                        .restAfterSeconds(5)
                        .build();
                
                routinePoses.add(routinePose);
            }
            
            routinePoseRepository.saveAll(routinePoses);
            existingRoutine.setPoses(routinePoses);
        }
        
        YogaRoutine updatedRoutine = yogaRoutineRepository.save(existingRoutine);
        log.info("Updated yoga routine: {}", id);
        
        return updatedRoutine;
    }

    @Override
    @Transactional
    public void deleteYogaRoutine(String id) {
        log.info("Deleting yoga routine: {}", id);
        
        if (!yogaRoutineRepository.existsById(id)) {
            throw new IllegalArgumentException("Routine not found with ID: " + id);
        }
        
        // Delete associated poses first
        routinePoseRepository.deleteByRoutineId(id);
        
        // Delete routine
        yogaRoutineRepository.deleteById(id);
        log.info("Deleted yoga routine: {}", id);
    }

    @Override
    @Transactional
    public YogaRoutine addPoseToRoutine(String routineId, String poseId, int orderIndex) {
        log.info("Adding pose {} to routine {} at index {}", poseId, routineId, orderIndex);
        
        YogaRoutine routine = yogaRoutineRepository.findById(routineId)
                .orElseThrow(() -> new IllegalArgumentException("Routine not found: " + routineId));
        
        YogaPoseDetails pose = yogaPoseDetailsRepository.findById(poseId)
                .orElseThrow(() -> new IllegalArgumentException("Pose not found: " + poseId));
        
        RoutinePose routinePose = RoutinePose.builder()
                .routine(routine)
                .poseCode(pose.getCode())
                .poseName(pose.getName())
                .orderIndex(orderIndex)
                .durationSeconds(60)
                .repetitions(1)
                .restAfterSeconds(5)
                .build();
        
        routinePoseRepository.save(routinePose);
        
        // Reload routine with updated poses
        return yogaRoutineRepository.findById(routineId).orElse(routine);
    }

    @Override
    @Transactional
    public YogaRoutine removePoseFromRoutine(String routineId, String poseId) {
        log.info("Removing pose {} from routine {}", poseId, routineId);
        
        YogaRoutine routine = yogaRoutineRepository.findById(routineId)
                .orElseThrow(() -> new IllegalArgumentException("Routine not found: " + routineId));
        
        List<RoutinePose> routinePoses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(routineId);
        routinePoses.stream()
                .filter(rp -> rp.getPoseCode().equals(poseId))
                .findFirst()
                .ifPresent(routinePoseRepository::delete);
        
        // Reload routine with updated poses
        return yogaRoutineRepository.findById(routineId).orElse(routine);
    }
}
