package com.yogadetection.repository;

import com.yogadetection.entity.BodyProgress;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface BodyProgressRepository extends JpaRepository<BodyProgress, String> {
    
    // Find all progress records for a user, ordered by recorded date (newest first)
    Page<BodyProgress> findByUserIdOrderByRecordedAtDesc(String userId, Pageable pageable);
    
    // Find all progress records for a user
    List<BodyProgress> findByUserIdOrderByRecordedAtDesc(String userId);
    
    // Find latest progress record for a user
    Optional<BodyProgress> findFirstByUserIdOrderByRecordedAtDesc(String userId);
    
    // Find progress records within a date range
    @Query("SELECT bp FROM BodyProgress bp WHERE bp.userId = :userId " +
           "AND bp.recordedAt BETWEEN :startDate AND :endDate " +
           "ORDER BY bp.recordedAt DESC")
    List<BodyProgress> findByUserIdAndDateRange(
        @Param("userId") String userId,
        @Param("startDate") OffsetDateTime startDate,
        @Param("endDate") OffsetDateTime endDate
    );
    
    // Count total records for a user
    long countByUserId(String userId);
}

