package com.yogadetection.exception;


import com.yogadetection.config.ErrorCode;

public class InvalidPasswordException extends BaseException {
    public InvalidPasswordException() {
        super(ErrorCode.INVALID_PASSWORD);
    }
}
