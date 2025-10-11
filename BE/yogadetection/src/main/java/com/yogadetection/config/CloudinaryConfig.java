package com.yogadetection.config;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CloudinaryConfig {
    @Value("${cloudinary.cloud_name}")
    private static String CLOUD_NAME;

    @Value("${cloudinary.api_key}")
    private static String API_KEY;

    @Value("${cloudinary.api_secret}")
    private static String API_SECRET;

    @Bean
    public Cloudinary cloudinary() {
        return new Cloudinary(ObjectUtils.asMap(
                "cloud_name", CLOUD_NAME,
                "api_key", API_KEY,
                "api_secret", API_SECRET
        ));
    }
}

