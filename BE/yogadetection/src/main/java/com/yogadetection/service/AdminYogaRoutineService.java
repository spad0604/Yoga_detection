package com.yogadetection.service;

import com.yogadetection.dto.request.CreateYogaRoutineRequest;
import com.yogadetection.dto.request.UpdateYogaRoutineRequest;
import com.yogadetection.entity.YogaRoutine;

public interface AdminYogaRoutineService {
    YogaRoutine createYogaRoutine(CreateYogaRoutineRequest request);
    YogaRoutine updateYogaRoutine(String id, UpdateYogaRoutineRequest request);
    void deleteYogaRoutine(String id);
    YogaRoutine addPoseToRoutine(String routineId, String poseId, int orderIndex);
    YogaRoutine removePoseFromRoutine(String routineId, String poseId);
}
