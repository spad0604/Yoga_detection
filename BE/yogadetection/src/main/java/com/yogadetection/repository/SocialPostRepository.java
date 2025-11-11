package com.yogadetection.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yogadetection.entity.SocialPost;
import com.yogadetection.entity.SocialPost.Visibility;

public interface SocialPostRepository extends JpaRepository<SocialPost, String> {
    Page<SocialPost> findByAuthorIdInOrVisibilityOrderByCreatedAtDesc(List<String> authorIds, Visibility visibility, Pageable pageable);
    Page<SocialPost> findByAuthorIdInOrderByCreatedAtDesc(List<String> authorIds, Pageable pageable);
    Page<SocialPost> findByVisibilityOrderByCreatedAtDesc(Visibility visibility, Pageable pageable);
    Page<SocialPost> findByAuthorIdOrderByCreatedAtDesc(String authorId, Pageable pageable);
}


