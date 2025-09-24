package com.yogadetection.dto.response;

import lombok.Data;

import java.util.Map;

@Data
public class ApiResponse {
    private int error;
    private Map <String, Object> data;
}
