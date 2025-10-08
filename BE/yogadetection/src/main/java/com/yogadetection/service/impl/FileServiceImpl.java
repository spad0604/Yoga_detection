package com.yogadetection.service.impl;

import com.yogadetection.exception.BadRequestException;
import com.yogadetection.service.FileService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//@Service
//public class FileServiceImpl implements FileService {


//    @Override
//    public void upload(MultipartFile file) {
//        try {
//            if (file.isEmpty()) {
//                throw new BadRequestException();
//            }
//
//            // Tạo thư mục nếu chưa có
//            File dir = new File(UPLOAD_DIR);
//            if (!dir.exists()) {
//                dir.mkdirs();
//            }
//
//            // Tạo đường dẫn lưu
//            Path filePath = Paths.get(UPLOAD_DIR, file.getOriginalFilename());
//
//            // Lưu file
//            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
//
//            // Trả về đường dẫn
//            String fileUrl = "/files/" + file.getOriginalFilename();
//            return ResponseEntity.ok(fileUrl);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//            return ResponseEntity.internalServerError().body("Upload failed");
//        }
//    }
//}
