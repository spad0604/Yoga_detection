package com.yogadetection.service;

import org.springframework.web.multipart.MultipartFile;

import java.time.OffsetDateTime;
import java.time.ZonedDateTime;

public interface ImageService {
    
    String uploadImage(MultipartFile file, String ownerId);
    
    String uploadImageFromBytes(byte[] imageBytes, String ownerId, String filename);
    
    ZonedDateTime convertToVNTime(OffsetDateTime utcTime);
}
