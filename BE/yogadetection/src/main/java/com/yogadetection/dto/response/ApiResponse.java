package com.yogadetection.dto.response;

import com.yogadetection.config.ErrorCode;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApiResponse<T> {
    @Builder.Default
    private int code = ErrorCode.SUCCESS;
    
    @Builder.Default
    private int status = 200;
    
    private String message;
    private T data;

    public ApiResponse(T data) {
        this.code = ErrorCode.SUCCESS;
        this.status = 200;
        this.data = data;
    }

    public ApiResponse(int code) {
        this.code = code;
        this.status = code >= 400 ? code : 200;
    }

    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(data);
    }

    public static <T> ApiResponse<T> defaultResponse() {
        return new ApiResponse<>();
    }

    public static <T> ApiResponse<T> error(int code) {
        return new ApiResponse<>(code);
    }
}
