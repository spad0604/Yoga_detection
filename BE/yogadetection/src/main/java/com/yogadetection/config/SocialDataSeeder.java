package com.yogadetection.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import com.yogadetection.entity.Friendship;
import com.yogadetection.entity.Friendship.FriendshipStatus;
import com.yogadetection.entity.GroupMember;
import com.yogadetection.entity.GroupMember.MemberRole;
import com.yogadetection.entity.User;
import com.yogadetection.entity.UserActivity;
import com.yogadetection.entity.UserActivity.ActivityType;
import com.yogadetection.entity.YogaGroup;
import com.yogadetection.repository.FriendshipRepository;
import com.yogadetection.repository.GroupMemberRepository;
import com.yogadetection.repository.UserActivityRepository;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.repository.YogaGroupRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Seed data cho Social Features
 * Chạy tự động khi khởi động app (chỉ trong dev/staging)
 * Sử dụng @Profile("!production") để không chạy trong production
 */
@Slf4j
@Configuration
@Profile("!production")
@RequiredArgsConstructor
public class SocialDataSeeder {

    private final UserRepository userRepository;
    private final FriendshipRepository friendshipRepository;
    private final YogaGroupRepository groupRepository;
    private final GroupMemberRepository groupMemberRepository;
    private final UserActivityRepository activityRepository;

    @Bean
    CommandLineRunner initSocialData() {
        return args -> {
            log.info("🌱 Starting Social Data Seeder...");
            
            try {
                // Seed sample groups
                seedSampleGroups();
                
                // Seed sample friendships (nếu có users)
                seedSampleFriendships();
                
                // Seed sample activities
                seedSampleActivities();
                
                log.info("✅ Social Data Seeder completed successfully!");
            } catch (Exception e) {
                log.warn("⚠️ Social Data Seeder encountered issues: {}", e.getMessage());
                // Không throw exception để không block app startup
            }
        };
    }

    private void seedSampleGroups() {
        if (groupRepository.count() > 0) {
            log.info("Groups already exist, skipping seed");
            return;
        }

        // Lấy user đầu tiên làm owner (hoặc tạo mock)
        User defaultOwner = userRepository.findAll().stream()
            .findFirst()
            .orElse(null);

        if (defaultOwner == null) {
            log.warn("No users found, cannot seed groups");
            return;
        }

        YogaGroup morningGroup = YogaGroup.builder()
            .id("group-morning-yoga-001")
            .name("Morning Yoga Club")
            .description("🌅 Start your day with energy! Join us for daily morning yoga sessions.")
            .imageUrl("https://images.unsplash.com/photo-1544367567-0f2fcb009e0b")
            .ownerId(defaultOwner.getId())
            .isPrivate(false)
            .memberCount(1)
            .build();
        groupRepository.save(morningGroup);

        // Add owner as member
        groupMemberRepository.save(GroupMember.builder()
            .id("gm-morning-001")
            .groupId(morningGroup.getId())
            .userId(defaultOwner.getId())
            .role(MemberRole.OWNER)
            .build());

        YogaGroup eveningGroup = YogaGroup.builder()
            .id("group-evening-relax-002")
            .name("Evening Relaxation")
            .description("🌙 Unwind after a long day. Evening yoga for stress relief and better sleep.")
            .imageUrl("https://images.unsplash.com/photo-1506126613408-eca07ce68773")
            .ownerId(defaultOwner.getId())
            .isPrivate(false)
            .memberCount(1)
            .build();
        groupRepository.save(eveningGroup);

        groupMemberRepository.save(GroupMember.builder()
            .id("gm-evening-001")
            .groupId(eveningGroup.getId())
            .userId(defaultOwner.getId())
            .role(MemberRole.OWNER)
            .build());

        YogaGroup advancedGroup = YogaGroup.builder()
            .id("group-advanced-yoga-003")
            .name("Advanced Yoga Masters")
            .description("💪 For experienced yogis. Challenge yourself with advanced poses and routines.")
            .imageUrl("https://images.unsplash.com/photo-1588286840104-8957b019727f")
            .ownerId(defaultOwner.getId())
            .isPrivate(true)
            .memberCount(1)
            .build();
        groupRepository.save(advancedGroup);

        groupMemberRepository.save(GroupMember.builder()
            .id("gm-advanced-001")
            .groupId(advancedGroup.getId())
            .userId(defaultOwner.getId())
            .role(MemberRole.OWNER)
            .build());

        log.info("✅ Created 3 sample groups");
    }

    private void seedSampleFriendships() {
        // Chỉ seed nếu có ít nhất 2 users
        long userCount = userRepository.count();
        if (userCount < 2 || friendshipRepository.count() > 0) {
            log.info("Not enough users or friendships already exist, skipping seed");
            return;
        }

        // Lấy 2 users đầu tiên làm sample
        var users = userRepository.findAll().stream().limit(2).toList();
        if (users.size() < 2) return;

        User user1 = users.get(0);
        User user2 = users.get(1);

        // Tạo friend request (pending)
        Friendship pendingRequest = Friendship.builder()
            .id("friendship-pending-001")
            .userId(user1.getId())
            .friendId(user2.getId())
            .status(FriendshipStatus.PENDING)
            .build();
        friendshipRepository.save(pendingRequest);

        log.info("✅ Created 1 sample pending friendship");
    }

    private void seedSampleActivities() {
        if (activityRepository.count() > 0) {
            log.info("Activities already exist, skipping seed");
            return;
        }

        User defaultUser = userRepository.findAll().stream()
            .findFirst()
            .orElse(null);

        if (defaultUser == null) {
            log.warn("No users found, cannot seed activities");
            return;
        }

        // Sample activities
        activityRepository.save(UserActivity.builder()
            .id("activity-001")
            .userId(defaultUser.getId())
            .activityType(ActivityType.POSE_COMPLETED)
            .title("Completed Mountain Pose")
            .description("Great job! You scored 95 points on Mountain Pose.")
            .metadata("{\"score\": 95, \"poseId\": \"mountain-pose\"}")
            .build());

        activityRepository.save(UserActivity.builder()
            .id("activity-002")
            .userId(defaultUser.getId())
            .activityType(ActivityType.ROUTINE_COMPLETED)
            .title("Completed Morning Energizer Routine")
            .description("Awesome! You finished the Morning Energizer routine with an average score of 92.")
            .metadata("{\"routineId\": \"routine-001\", \"averageScore\": 92}")
            .build());

        activityRepository.save(UserActivity.builder()
            .id("activity-003")
            .userId(defaultUser.getId())
            .activityType(ActivityType.PERFECT_SCORE)
            .title("Perfect Score! 🎉")
            .description("Amazing! You achieved a perfect 100 score on Downward Dog pose.")
            .metadata("{\"score\": 100, \"poseId\": \"downward-dog\"}")
            .build());

        log.info("✅ Created 3 sample activities");
    }
}

