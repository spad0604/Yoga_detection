package com.yogadetection.dto.response;

import com.yogadetection.entity.enums.UserProviderEnum;
import com.yogadetection.entity.enums.UserRoleEnum;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
public class UserInfoResponse {
    private String id;
    private String email;
    private String firstName;
    private String lastName;
    private String dob;
    private LocalDate birthDate;
    private String registerDate;
    private LocalDateTime registerDateTime;
    private String avatarUrl;
    private UserProviderEnum provider;
    private UserRoleEnum role;

}
