package com.yogadetection.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.yogadetection.dto.MultipartHttpServletRequest;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Part;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;


@Service
@AllArgsConstructor
@SuppressWarnings("unchecked")
public class UploadService {
    @Value("${cloudinary.cloud_name}")
    private static String CLOUD_NAME;

    @Value("${cloudinary.api_key}")
    private static String API_KEY;

    @Value("${cloudinary.api_secret}")
    private static String API_SECRET;

    public Map<String, Object> callExternalAPI(MultipartHttpServletRequest request) throws ServletException, IOException {

        Part filePart = request.getPart("image");
        try (InputStream inputStream = filePart.getInputStream()) {

            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", CLOUD_NAME,
                    "api_key", API_KEY,
                    "api_secret", API_SECRET
            ));

            return cloudinary.uploader().upload(
                    inputStream,
                    ObjectUtils.emptyMap()
            );

        }
    }

}
