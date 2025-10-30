package com.yogadetection.entity;

import java.time.OffsetDateTime;

import org.hibernate.annotations.GenericGenerator;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Table(name = "group_post")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class GroupPost {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String id;

    @Column(name = "group_id", nullable = false)
    private String groupId;

    @Column(name = "author_id", nullable = false)
    private String authorId;

    @Column(name = "content", columnDefinition = "TEXT")
    private String content;

    @Column(name = "image_urls", columnDefinition = "TEXT")
    private String imageUrls; // JSON array as string (optional)

    @Column(name = "like_count")
    private Integer likeCount;

    @Column(name = "comment_count")
    private Integer commentCount;

    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @Column(name = "updated_at")
    private OffsetDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = OffsetDateTime.now();
        updatedAt = OffsetDateTime.now();
        if (likeCount == null) likeCount = 0;
        if (commentCount == null) commentCount = 0;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = OffsetDateTime.now();
    }
}


