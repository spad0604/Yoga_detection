package com.yogadetection.entity;

import jakarta.persistence.*;
import com.yogadetection.enums.YogaPoseLevelEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

@Data
@Entity
@Table(name = "\"yoga_pose_details\"")
@NoArgsConstructor
@AllArgsConstructor
public class YogaPoseDetails {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String code;
    @Column(name = "name", nullable = false)
    private String name;
    @Column(name = "image_url")
    private String imageUrl;
    @Column(name =  "total_minutes", nullable = false)
    private int totalMinutes;
    @Column(name = "total_calos", nullable = false)
    private int totalCalos;
    @Enumerated(EnumType.STRING)
    @Column(name = "level", nullable = false)
    private YogaPoseLevelEnum level;
    @Column(name = "description")
    private String description;
}
