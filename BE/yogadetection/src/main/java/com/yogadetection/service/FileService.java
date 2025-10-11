package com.yogadetection.service;


import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

public interface FileService {

    void saveFile(String assetId, String url, String token, LocalDateTime createDate);
}
