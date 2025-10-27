package com.yogadetection.repository;

import com.yogadetection.entity.YogaPoseAttempt;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.OffsetDateTime;
import java.util.List;

@Repository
public interface YogaPoseAttemptRepository extends JpaRepository<YogaPoseAttempt, String> {
    
    // Lấy danh sách attempts của user với phân trang
    Page<YogaPoseAttempt> findByUserIdOrderByCreatedAtDesc(String userId, Pageable pageable);
    
    // Lấy attempts của user theo pose code cụ thể
    Page<YogaPoseAttempt> findByUserIdAndPoseCodeOrderByCreatedAtDesc(
            String userId, String poseCode, Pageable pageable);
    
    // Lấy attempts trong khoảng thời gian
    @Query("SELECT a FROM YogaPoseAttempt a WHERE a.userId = :userId " +
           "AND a.createdAt BETWEEN :startDate AND :endDate " +
           "ORDER BY a.createdAt DESC")
    Page<YogaPoseAttempt> findByUserIdAndDateRange(
            @Param("userId") String userId,
            @Param("startDate") OffsetDateTime startDate,
            @Param("endDate") OffsetDateTime endDate,
            Pageable pageable);
    
    // Lấy điểm trung bình của user cho một pose
    @Query("SELECT AVG(a.score) FROM YogaPoseAttempt a " +
           "WHERE a.userId = :userId AND a.poseCode = :poseCode AND a.score IS NOT NULL")
    Double getAverageScoreByUserAndPose(
            @Param("userId") String userId, 
            @Param("poseCode") String poseCode);
    
    // Lấy điểm cao nhất của user cho một pose
    @Query("SELECT MAX(a.score) FROM YogaPoseAttempt a " +
           "WHERE a.userId = :userId AND a.poseCode = :poseCode")
    Double getHighestScoreByUserAndPose(
            @Param("userId") String userId,
            @Param("poseCode") String poseCode);
    
    // Đếm số lần thực hiện của user
    Long countByUserId(String userId);
    
    // Lấy lần attempt cuối cùng của user
    @Query("SELECT a FROM YogaPoseAttempt a WHERE a.userId = :userId " +
           "ORDER BY a.createdAt DESC")
    List<YogaPoseAttempt> findLatestAttemptByUserId(@Param("userId") String userId, Pageable pageable);
    
    // Đếm số lần thực hiện pose cụ thể
    Long countByUserIdAndPoseCode(String userId, String poseCode);
}
