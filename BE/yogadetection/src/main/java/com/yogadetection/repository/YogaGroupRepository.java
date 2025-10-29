package com.yogadetection.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yogadetection.entity.YogaGroup;

@Repository
public interface YogaGroupRepository extends JpaRepository<YogaGroup, String> {
    
    Page<YogaGroup> findByOwnerIdOrderByCreatedAtDesc(String ownerId, Pageable pageable);
    
    @Query("SELECT g FROM YogaGroup g WHERE g.isPrivate = false ORDER BY g.memberCount DESC, g.createdAt DESC")
    Page<YogaGroup> findPublicGroups(Pageable pageable);
    
    @Query("SELECT g FROM YogaGroup g WHERE LOWER(g.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR LOWER(g.description) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    Page<YogaGroup> searchGroups(@Param("keyword") String keyword, Pageable pageable);
}

