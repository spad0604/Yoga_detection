package com.yogadetection.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yogadetection.entity.GroupPostLike;

@Repository
public interface GroupPostLikeRepository extends JpaRepository<GroupPostLike, String> {

    @Query("SELECT l FROM GroupPostLike l WHERE l.postId = :postId AND l.userId = :userId")
    Optional<GroupPostLike> findByPostIdAndUserId(@Param("postId") String postId, @Param("userId") String userId);

    @Query("SELECT COUNT(l) FROM GroupPostLike l WHERE l.postId = :postId")
    long countByPostId(@Param("postId") String postId);
}


