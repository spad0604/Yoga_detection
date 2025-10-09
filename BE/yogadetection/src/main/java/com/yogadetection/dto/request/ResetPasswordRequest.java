package com.yogadetection.dto.request;

import lombok.Data;

@Data
public class ResetPasswordRequest {
    private String newPassword;
    private String confirmNewPassword;
}
