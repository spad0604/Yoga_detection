package com.yogadetection.dto.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserInfoResponse {
    private String id;
    private String email;
    private String firstName;
    private String lastName;
    private String dob;
    private String registerDate;
    private String avatarUrl;

}
