package com.yogadetection.service;

import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.YogaRoutineResponse;
import com.yogadetection.enums.YogaPoseLevelEnum;

public interface YogaRoutineService {
    
    /**
     * Lấy danh sách tất cả routines với phân trang
     */
    PagedResponse<YogaRoutineResponse> getAllRoutines(int page, int size, String userId);
    
    /**
     * Lấy chi tiết một routine
     */
    YogaRoutineResponse getRoutineById(String routineId, String userId);
    
    /**
     * Lấy routines theo level
     */
    PagedResponse<YogaRoutineResponse> getRoutinesByLevel(YogaPoseLevelEnum level, int page, int size, String userId);
    
    /**
     * Tìm kiếm routines theo keyword
     */
    PagedResponse<YogaRoutineResponse> searchRoutines(String keyword, int page, int size, String userId);
    
    /**
     * Lọc routines theo tiêu chí
     */
    PagedResponse<YogaRoutineResponse> filterRoutines(YogaPoseLevelEnum level, Boolean isPremium, int page, int size, String userId);
}

