package com.yogadetection.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.yogadetection.entity.Image;
import com.yogadetection.repository.ImageRepository;
import com.yogadetection.service.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService {
    
    private final Cloudinary cloudinary;
    private final ImageRepository imageRepository;

    @Override
    public String uploadImage(MultipartFile file, String ownerId) {
        try {
            // Upload to Cloudinary
            Map<String, Object> uploadResult = cloudinary.uploader().upload(
                    file.getBytes(),
                    ObjectUtils.asMap(
                            "folder", "yoga_poses",
                            "resource_type", "image"
                    )
            );
            
            String imageUrl = (String) uploadResult.get("secure_url");
            String publicId = (String) uploadResult.get("public_id");
            
            // Save to database
            Image image = Image.builder()
                    .id(publicId)
                    .ownerId(ownerId)
                    .url(imageUrl)
                    .createAt(OffsetDateTime.now())
                    .build();
            
            imageRepository.save(image);
            
            log.info("Image uploaded successfully: {} for owner: {}", imageUrl, ownerId);
            return imageUrl;
            
        } catch (Exception e) {
            log.error("Failed to upload image for owner {}: {}", ownerId, e.getMessage(), e);
            throw new RuntimeException("Failed to upload image: " + e.getMessage());
        }
    }

    @Override
    public String uploadImageFromBytes(byte[] imageBytes, String ownerId, String filename) {
        try {
            // Upload to Cloudinary
            Map<String, Object> uploadResult = cloudinary.uploader().upload(
                    imageBytes,
                    ObjectUtils.asMap(
                            "folder", "yoga_poses",
                            "public_id", "pose_" + UUID.randomUUID(),
                            "resource_type", "image"
                    )
            );
            
            String imageUrl = (String) uploadResult.get("secure_url");
            String publicId = (String) uploadResult.get("public_id");
            
            // Save to database
            Image image = Image.builder()
                    .id(publicId)
                    .ownerId(ownerId)
                    .url(imageUrl)
                    .createAt(OffsetDateTime.now())
                    .build();
            
            imageRepository.save(image);
            
            log.info("Image uploaded from bytes successfully: {} for owner: {}", imageUrl, ownerId);
            return imageUrl;
            
        } catch (Exception e) {
            log.error("Failed to upload image from bytes for owner {}: {}", ownerId, e.getMessage(), e);
            throw new RuntimeException("Failed to upload image: " + e.getMessage());
        }
    }

    @Override
    public ZonedDateTime convertToVNTime(OffsetDateTime utcTime) {
        return utcTime.atZoneSameInstant(ZoneId.of("Asia/Ho_Chi_Minh"));
    }
}
