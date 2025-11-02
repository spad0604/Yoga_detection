package com.yogadetection.dto.response;

import com.yogadetection.entity.enums.UserProviderEnum;

import com.yogadetection.entity.enums.UserRoleEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TokenResponse {
    private String userId;
    private UserProviderEnum userProvider;
    private UserRoleEnum userRole;
    private String accessToken;
    private String refreshToken;

    public TokenResponse(String accessToken) {
        this.userId = "";
        this.userRole = UserRoleEnum.USER;
        this.userProvider = UserProviderEnum.ACCOUNT_CREATION;
        this.accessToken = accessToken;
        this.refreshToken = null;
    }
}
