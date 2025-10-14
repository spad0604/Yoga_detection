package com.yogadetection.service;


import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;

public interface FileService {

    void saveFile(String assetId, String url, String token, OffsetDateTime createAt);
}
