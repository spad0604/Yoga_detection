package com.yogadetection.exception;

import com.yogadetection.config.ErrorCode;

public class OtpExpiredException extends BaseException {
    public OtpExpiredException(){
        super(ErrorCode.OTP_EXPIRED);
    }
}
