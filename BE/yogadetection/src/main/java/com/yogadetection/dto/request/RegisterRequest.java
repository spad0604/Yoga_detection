package com.yogadetection.dto.request;

import com.yogadetection.entity.enums.UserProviderEnum;
import com.yogadetection.entity.enums.UserRoleEnum;

import lombok.Data;
import lombok.Builder;
import lombok.Builder.Default;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
public class RegisterRequest {
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private LocalDate birthDate;
    private UserProviderEnum userProvider = UserProviderEnum.ACCOUNT_CREATION;
    private UserRoleEnum userRole = UserRoleEnum.USER;
}
