package com.yogadetection.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yogadetection.entity.SocialPostLike;

public interface SocialPostLikeRepository extends JpaRepository<SocialPostLike, String> {
    Optional<SocialPostLike> findByPostIdAndUserId(String postId, String userId);
}


