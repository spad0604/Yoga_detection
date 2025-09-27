package com.exception;

import com.config.ErrorCode;

public class EmailExistsException extends BaseException {
    public EmailExistsException() {
        super(ErrorCode.EMAIL_ALREADY_EXISTS);
    }
}
