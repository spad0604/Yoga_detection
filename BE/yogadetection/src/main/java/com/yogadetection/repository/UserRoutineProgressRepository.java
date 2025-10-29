package com.yogadetection.repository;

import com.yogadetection.entity.UserRoutineProgress;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRoutineProgressRepository extends JpaRepository<UserRoutineProgress, String> {
    
    Optional<UserRoutineProgress> findByUserIdAndRoutineId(String userId, String routineId);
    
    Page<UserRoutineProgress> findByUserIdOrderByLastPracticedAtDesc(String userId, Pageable pageable);
    
    List<UserRoutineProgress> findByUserIdAndIsCompleted(String userId, Boolean isCompleted);
    
    @Query("SELECT urp FROM UserRoutineProgress urp WHERE urp.userId = :userId AND urp.isCompleted = true ORDER BY urp.completedAt DESC")
    Page<UserRoutineProgress> findCompletedRoutinesByUser(@Param("userId") String userId, Pageable pageable);
    
    @Query("SELECT urp FROM UserRoutineProgress urp WHERE urp.userId = :userId AND urp.isCompleted = false ORDER BY urp.lastPracticedAt DESC")
    Page<UserRoutineProgress> findInProgressRoutinesByUser(@Param("userId") String userId, Pageable pageable);
    
    @Query("SELECT COUNT(urp) FROM UserRoutineProgress urp WHERE urp.userId = :userId AND urp.isCompleted = true")
    Long countCompletedRoutinesByUser(@Param("userId") String userId);
    
    @Query("SELECT AVG(urp.averageScore) FROM UserRoutineProgress urp WHERE urp.userId = :userId AND urp.isCompleted = true")
    Double getAverageScoreByUser(@Param("userId") String userId);
}

