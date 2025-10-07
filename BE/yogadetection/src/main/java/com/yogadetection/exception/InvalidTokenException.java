package com.yogadetection.exception;


import com.yogadetection.config.ErrorCode;

public class InvalidTokenException extends BaseException {
    public InvalidTokenException() {
        super(ErrorCode.INVALID_TOKEN);
    }
}
