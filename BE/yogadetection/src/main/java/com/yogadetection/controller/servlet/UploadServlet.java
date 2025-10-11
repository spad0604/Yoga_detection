package com.yogadetection.controller.servlet;

import com.yogadetection.config.ErrorCode;
import com.yogadetection.dto.MultipartHttpServletRequest;
import com.yogadetection.dto.MultipartFile;
import com.yogadetection.service.FileService;
import com.yogadetection.service.JwtService;
import com.yogadetection.utils.ParamKey;
import org.json.JSONObject;
import com.yogadetection.service.UploadService;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;

import java.io.File;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Map;

@WebServlet("/upload")
@MultipartConfig
@AllArgsConstructor
public class UploadServlet extends HttpServlet {

    private final UploadService uploadService;
    private final JwtService jwtService;
    private final FileService fileService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/plain; charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_OK);
            JSONObject obj = new JSONObject();

            String token = request.getHeader("Authorization");
            if (token == null || token.isEmpty()) {
                obj.put(ParamKey.CODE, ErrorCode.UNAUTHORIZED_ERROR);
                obj.put(ParamKey.DATA, JSONObject.NULL);
                try (PrintWriter out = response.getWriter()) {
                    out.write(obj.toString());
                }
                return;
            }

            String contentType = request.getContentType();
            if (contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
                obj.put(ParamKey.CODE, ErrorCode.WRONG_DATA_FORMAT);
                obj.put(ParamKey.DATA, JSONObject.NULL);
                try (PrintWriter out = response.getWriter()) {
                    out.write(obj.toString());
                }
                return;
            }

            MultipartHttpServletRequest multipartRequest = new MultipartHttpServletRequest(request);

            MultipartFile file = multipartRequest.getFile("image");
            if (file == null) {
                obj.put(ParamKey.CODE, ErrorCode.WRONG_DATA_FORMAT);
                obj.put(ParamKey.DATA, JSONObject.NULL);
                return;
            }
            Map<String, Object> fileDetail = uploadService.callExternalAPI(multipartRequest);
            String assetId = fileDetail.get(ParamKey.FILE_ID).toString();
            String url = fileDetail.get(ParamKey.URL).toString();
            LocalDateTime createdAt = LocalDateTime.parse(fileDetail.get(ParamKey.CREATED_AT).toString());

            fileService.saveFile(assetId, url, token, createdAt);
            obj.put(ParamKey.CODE, ErrorCode.SUCCESS);
            JSONObject result = new JSONObject();
            result.put(ParamKey.URL, url);
            obj.put(ParamKey.DATA, result);
            try (PrintWriter out = response.getWriter()) {
                out.write(obj.toString());
            }

        } catch (Exception e) {
            response.setStatus(ErrorCode.WRONG_DATA_FORMAT);
        }
    }
}
