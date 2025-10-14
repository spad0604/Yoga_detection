package com.yogadetection.service.impl;

import com.yogadetection.entity.Image;
import com.yogadetection.repository.ImageRepository;
import com.yogadetection.service.FileService;
import com.yogadetection.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;

@Service
@AllArgsConstructor
public class FileServiceImpl implements FileService {

    private final UserService userService;
    private final ImageRepository imageRepository;

    @Override
    public void saveFile(String assetId, String url, String token, OffsetDateTime createAt) {
        String userId = userService.getUserId(token);
        imageRepository.save(new Image(assetId, userId, url, createAt));
    }
}
