package com.exception;

import com.config.ErrorCode;

public class BadRequestException extends BaseException {

    public BadRequestException() {
        super(ErrorCode.INVALID_FORMAT);
    }
}
