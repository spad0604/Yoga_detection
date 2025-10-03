package com.dto.request;

import lombok.Data;

@Data
public class VerifyOTPRequest {
    private String otp;
    private String email;
}
