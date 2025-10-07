package com.yogadetection.exception;

import com.yogadetection.config.ErrorCode;

public class EmailExistsException extends BaseException {
    public EmailExistsException() {
        super(ErrorCode.EMAIL_ALREADY_EXISTS);
    }
}
