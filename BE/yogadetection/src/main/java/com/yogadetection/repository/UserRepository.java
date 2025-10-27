package com.yogadetection.repository;

import com.yogadetection.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);

    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.fcmToken = :fcmToken WHERE u.email = :userName")
    void saveFcmToken(@Param("fcmToken") String fcmToken, @Param("userName") String userName);

    Optional<User> findById(String id);

    boolean existsByEmail(String username);
    
    @Query("SELECT u FROM User u WHERE u.fcmToken IS NOT NULL AND u.fcmToken != ''")
    List<User> findAllUsersWithFcmToken();
}
