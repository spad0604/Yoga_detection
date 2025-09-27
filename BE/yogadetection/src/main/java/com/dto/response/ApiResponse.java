package com.dto.response;

import com.config.ErrorCode;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.http.HttpStatus;

import java.util.Map;

@Data
@AllArgsConstructor
public class ApiResponse<T> {
    private int status = HttpStatus.OK.value();;
    private int code = ErrorCode.SUCCESS;
    private T data;

    public ApiResponse() {
        this.code = ErrorCode.SUCCESS;
    }

    public ApiResponse(T data) {
        this.data = data;
    }

    public ApiResponse(int code) {
        this.code = code;
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
