package com.yogadetection.repository;

import com.yogadetection.entity.YogaRoutine;
import com.yogadetection.enums.YogaPoseLevelEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface YogaRoutineRepository extends JpaRepository<YogaRoutine, String> {
    
    Page<YogaRoutine> findAllByOrderByOrderIndexAsc(Pageable pageable);
    
    List<YogaRoutine> findByLevelOrderByOrderIndexAsc(YogaPoseLevelEnum level);
    
    @Query("SELECT r FROM YogaRoutine r WHERE r.isPremium = :isPremium ORDER BY r.orderIndex ASC")
    Page<YogaRoutine> findByIsPremium(@Param("isPremium") Boolean isPremium, Pageable pageable);
    
    @Query("SELECT r FROM YogaRoutine r WHERE " +
           "(:level IS NULL OR r.level = :level) AND " +
           "(:isPremium IS NULL OR r.isPremium = :isPremium) " +
           "ORDER BY r.orderIndex ASC")
    Page<YogaRoutine> findByFilters(
        @Param("level") YogaPoseLevelEnum level,
        @Param("isPremium") Boolean isPremium,
        Pageable pageable
    );
    
    @Query("SELECT r FROM YogaRoutine r WHERE " +
           "LOWER(r.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(r.description) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
           "ORDER BY r.orderIndex ASC")
    Page<YogaRoutine> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);
}

