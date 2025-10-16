package com.yogadetection.controller;

import com.yogadetection.dto.MultipartHttpServletRequest;
import com.yogadetection.service.DeepSeekService;
import com.yogadetection.service.UploadService;
import jakarta.servlet.ServletException;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/deepseek")
public class DeepSeekController {
    private final DeepSeekService deepSeekService;
    private final UploadService uploadService;

    @PostMapping("/ask")
    public String ask() throws ServletException, IOException {
        return deepSeekService.ask("http://res.cloudinary.com/dschfstww/image/upload/v1760602014/s0mwjgpkgoordsn1fmwh.png");
    }
}
