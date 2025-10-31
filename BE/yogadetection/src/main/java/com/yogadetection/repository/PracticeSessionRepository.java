package com.yogadetection.repository;

import com.yogadetection.entity.PracticeSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PracticeSessionRepository extends JpaRepository<PracticeSession, String> {
    
    Optional<PracticeSession> findByIdAndUserId(String id, String userId);
    
    @Query("SELECT ps FROM PracticeSession ps WHERE ps.userId = :userId AND ps.status = :status ORDER BY ps.startedAt DESC")
    Page<PracticeSession> findByUserIdAndStatus(@Param("userId") String userId, @Param("status") PracticeSession.SessionStatus status, Pageable pageable);
    
    @Query("SELECT ps FROM PracticeSession ps WHERE ps.userId = :userId ORDER BY ps.startedAt DESC")
    Page<PracticeSession> findByUserId(@Param("userId") String userId, Pageable pageable);
    
    @Query("SELECT ps FROM PracticeSession ps WHERE ps.userId = :userId AND ps.routineId = :routineId ORDER BY ps.startedAt DESC")
    List<PracticeSession> findByUserIdAndRoutineId(@Param("userId") String userId, @Param("routineId") String routineId);
    
    // Find the latest in-progress session for a routine
    @Query("SELECT ps FROM PracticeSession ps WHERE ps.userId = :userId AND ps.routineId = :routineId AND ps.status = 'IN_PROGRESS' ORDER BY ps.startedAt DESC")
    Optional<PracticeSession> findLatestInProgressSession(@Param("userId") String userId, @Param("routineId") String routineId);
    
    // Find sessions by date range
    @Query("SELECT ps FROM PracticeSession ps WHERE ps.userId = :userId AND ps.startedAt BETWEEN :startDate AND :endDate ORDER BY ps.startedAt DESC")
    List<PracticeSession> findByUserIdAndStartedAtBetweenOrderByStartedAtDesc(
        @Param("userId") String userId, 
        @Param("startDate") java.time.OffsetDateTime startDate, 
        @Param("endDate") java.time.OffsetDateTime endDate
    );
    
    // Find sessions by status
    @Query("SELECT ps FROM PracticeSession ps WHERE ps.userId = :userId AND ps.status = :status ORDER BY ps.startedAt DESC")
    List<PracticeSession> findByUserIdAndStatusOrderByStartedAtDesc(@Param("userId") String userId, @Param("status") PracticeSession.SessionStatus status);
}
