package com.yogadetection.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yogadetection.entity.GroupPostComment;

@Repository
public interface GroupPostCommentRepository extends JpaRepository<GroupPostComment, String> {

    @Query("SELECT c FROM GroupPostComment c WHERE c.postId = :postId ORDER BY c.createdAt ASC")
    Page<GroupPostComment> findByPostId(@Param("postId") String postId, Pageable pageable);
    
    void deleteByPostId(String postId);
}


