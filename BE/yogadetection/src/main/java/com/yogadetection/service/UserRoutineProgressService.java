package com.yogadetection.service;

import com.yogadetection.dto.request.UpdateRoutineProgressRequest;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.UserRoutineProgressResponse;

public interface UserRoutineProgressService {
    
    /**
     * Bắt đầu một routine mới hoặc tiếp tục routine đang dở
     */
    UserRoutineProgressResponse startOrContinueRoutine(String userId, String routineId);
    
    /**
     * Cập nhật tiến độ khi hoàn thành một pose
     */
    UserRoutineProgressResponse updateProgress(String userId, UpdateRoutineProgressRequest request);
    
    /**
     * Lấy tiến độ của user cho một routine cụ thể
     */
    UserRoutineProgressResponse getProgress(String userId, String routineId);
    
    /**
     * Lấy tất cả routines đang tập của user
     */
    PagedResponse<UserRoutineProgressResponse> getInProgressRoutines(String userId, int page, int size);
    
    /**
     * Lấy tất cả routines đã hoàn thành của user
     */
    PagedResponse<UserRoutineProgressResponse> getCompletedRoutines(String userId, int page, int size);
    
    /**
     * Reset tiến độ của một routine
     */
    void resetProgress(String userId, String routineId);
    
    /**
     * Lấy thống kê tổng quan về routines của user
     */
    UserRoutineStatistics getUserStatistics(String userId);
    
    /**
     * Statistics class
     */
    class UserRoutineStatistics {
        private Long totalCompletedRoutines;
        private Double averageScore;
        private Integer totalTimeSpentMinutes;
        private Long inProgressRoutines;
        
        public UserRoutineStatistics(Long totalCompletedRoutines, Double averageScore, 
                                    Integer totalTimeSpentMinutes, Long inProgressRoutines) {
            this.totalCompletedRoutines = totalCompletedRoutines;
            this.averageScore = averageScore;
            this.totalTimeSpentMinutes = totalTimeSpentMinutes;
            this.inProgressRoutines = inProgressRoutines;
        }
        
        // Getters
        public Long getTotalCompletedRoutines() { return totalCompletedRoutines; }
        public Double getAverageScore() { return averageScore; }
        public Integer getTotalTimeSpentMinutes() { return totalTimeSpentMinutes; }
        public Long getInProgressRoutines() { return inProgressRoutines; }
    }
}

