package com.entity;

import lombok.Data;

@Data
public class OTPCode {
    private String code;
    private Integer expireTime;
}
