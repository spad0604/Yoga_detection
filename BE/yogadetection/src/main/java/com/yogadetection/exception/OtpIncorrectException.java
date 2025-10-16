package com.yogadetection.exception;

import com.yogadetection.config.ErrorCode;

public class OtpIncorrectException extends BaseException{
    public OtpIncorrectException(){
        super(ErrorCode.OTP_INCORRECT);
    }
}
