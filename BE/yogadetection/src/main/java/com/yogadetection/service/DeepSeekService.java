package com.yogadetection.service;

import org.springframework.web.multipart.MultipartFile;

public interface DeepSeekService {
    String ask(String imageUrl);
}
