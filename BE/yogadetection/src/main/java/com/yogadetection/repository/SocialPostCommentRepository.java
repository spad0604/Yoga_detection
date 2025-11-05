package com.yogadetection.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yogadetection.entity.SocialPostComment;

public interface SocialPostCommentRepository extends JpaRepository<SocialPostComment, String> {
    Page<SocialPostComment> findByPostIdOrderByCreatedAtDesc(String postId, Pageable pageable);
    void deleteByPostId(String postId);
}


