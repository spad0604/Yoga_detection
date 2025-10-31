package com.yogadetection.entity;

import java.time.OffsetDateTime;

import org.hibernate.annotations.GenericGenerator;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "social_post")
public class SocialPost {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String id;

    @Column(nullable = false)
    private String authorId;

    @Column(columnDefinition = "TEXT")
    private String content;

    // JSON array of image URLs
    @Column(columnDefinition = "TEXT")
    private String imageUrls;

    public enum Visibility { PUBLIC, FRIENDS }

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Visibility visibility;

    private Integer likeCount;
    private Integer commentCount;

    @Column(nullable = false)
    private OffsetDateTime createdAt;

    @Column(nullable = false)
    private OffsetDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = OffsetDateTime.now();
        this.updatedAt = this.createdAt;
        if (this.likeCount == null) this.likeCount = 0;
        if (this.commentCount == null) this.commentCount = 0;
        if (this.visibility == null) this.visibility = Visibility.PUBLIC;
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = OffsetDateTime.now();
    }
}


