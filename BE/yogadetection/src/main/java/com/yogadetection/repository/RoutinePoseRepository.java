package com.yogadetection.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yogadetection.entity.RoutinePose;

@Repository
public interface RoutinePoseRepository extends JpaRepository<RoutinePose, String> {
    
    @Query("SELECT rp FROM RoutinePose rp WHERE rp.routine.id = :routineId ORDER BY rp.orderIndex ASC")
    List<RoutinePose> findByRoutineIdOrderByOrderIndexAsc(@Param("routineId") String routineId);
    
    @Query("SELECT COUNT(rp) FROM RoutinePose rp WHERE rp.routine.id = :routineId")
    Integer countByRoutineId(@Param("routineId") String routineId);
    
    void deleteByRoutineId(String routineId);
}

