package com.yogadetection.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yogadetection.entity.UserActivity;

@Repository
public interface UserActivityRepository extends JpaRepository<UserActivity, String> {
    
    Page<UserActivity> findByUserIdOrderByCreatedAtDesc(String userId, Pageable pageable);
    
    @Query("SELECT ua FROM UserActivity ua WHERE ua.userId IN :userIds ORDER BY ua.createdAt DESC")
    Page<UserActivity> findByUserIdsOrderByCreatedAtDesc(@Param("userIds") List<String> userIds, Pageable pageable);
}

