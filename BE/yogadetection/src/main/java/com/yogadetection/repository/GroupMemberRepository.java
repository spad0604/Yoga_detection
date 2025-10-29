package com.yogadetection.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yogadetection.entity.GroupMember;

@Repository
public interface GroupMemberRepository extends JpaRepository<GroupMember, String> {
    
    Page<GroupMember> findByGroupIdOrderByJoinedAtAsc(String groupId, Pageable pageable);
    
    Page<GroupMember> findByUserIdOrderByJoinedAtDesc(String userId, Pageable pageable);
    
    Optional<GroupMember> findByGroupIdAndUserId(String groupId, String userId);
    
    @Query("SELECT COUNT(gm) FROM GroupMember gm WHERE gm.groupId = :groupId")
    Long countByGroupId(@Param("groupId") String groupId);
    
    @Query("SELECT CASE WHEN COUNT(gm) > 0 THEN true ELSE false END FROM GroupMember gm WHERE gm.groupId = :groupId AND gm.userId = :userId")
    Boolean isMember(@Param("groupId") String groupId, @Param("userId") String userId);
    
    void deleteByGroupIdAndUserId(String groupId, String userId);
}

