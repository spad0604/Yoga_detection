package com.yogadetection.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yogadetection.entity.GroupPost;

@Repository
public interface GroupPostRepository extends JpaRepository<GroupPost, String> {

    @Query("SELECT p FROM GroupPost p WHERE p.groupId = :groupId ORDER BY p.createdAt DESC")
    Page<GroupPost> findByGroupId(@Param("groupId") String groupId, Pageable pageable);
}


