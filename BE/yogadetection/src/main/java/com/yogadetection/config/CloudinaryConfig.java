package com.yogadetection.config;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CloudinaryConfig {

    @Bean
    public Cloudinary cloudinary() {
        return new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "your_cloud_name",     // 👈 thay bằng Cloud Name
                "api_key", "239764328796143",           // 👈 thay bằng API Key
                "api_secret", "gTaT66Kr_ZhdbuC0ZoeU4WSzASQ"
        ));
    }
}

