package com.yogadetection.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yogadetection.entity.Friendship;
import com.yogadetection.entity.Friendship.FriendshipStatus;

@Repository
public interface FriendshipRepository extends JpaRepository<Friendship, String> {
    
    @Query("SELECT f FROM Friendship f WHERE (f.userId = :userId OR f.friendId = :userId) AND f.status = :status")
    Page<Friendship> findByUserIdAndStatus(@Param("userId") String userId, @Param("status") FriendshipStatus status, Pageable pageable);

    @Query("SELECT f FROM Friendship f WHERE (f.userId = :userId OR f.friendId = :userId) AND f.status = :status")
    List<Friendship> findAllByUserIdAndStatus(@Param("userId") String userId, @Param("status") FriendshipStatus status);
    
    @Query("SELECT f FROM Friendship f WHERE f.friendId = :userId AND f.status = 'PENDING'")
    Page<Friendship> findPendingRequests(@Param("userId") String userId, Pageable pageable);
    
    @Query("SELECT f FROM Friendship f WHERE ((f.userId = :userId AND f.friendId = :friendId) OR (f.userId = :friendId AND f.friendId = :userId))")
    Optional<Friendship> findBetweenUsers(@Param("userId") String userId, @Param("friendId") String friendId);
    
    @Query("SELECT COUNT(f) FROM Friendship f WHERE (f.userId = :userId OR f.friendId = :userId) AND f.status = 'ACCEPTED'")
    Long countFriends(@Param("userId") String userId);
    
    @Query("SELECT CASE WHEN COUNT(f) > 0 THEN true ELSE false END FROM Friendship f WHERE ((f.userId = :userId AND f.friendId = :friendId) OR (f.userId = :friendId AND f.friendId = :userId)) AND f.status = 'ACCEPTED'")
    Boolean areFriends(@Param("userId") String userId, @Param("friendId") String friendId);
}

