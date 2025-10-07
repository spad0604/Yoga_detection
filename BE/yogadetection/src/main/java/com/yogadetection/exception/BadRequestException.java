package com.yogadetection.exception;

import com.yogadetection.config.ErrorCode;

public class BadRequestException extends BaseException {

    public BadRequestException() {
        super(ErrorCode.INVALID_FORMAT);
    }
}
