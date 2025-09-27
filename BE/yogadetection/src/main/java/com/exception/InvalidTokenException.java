package com.exception;


import com.config.ErrorCode;

public class InvalidTokenException extends BaseException {
    public InvalidTokenException() {
        super(ErrorCode.INVALID_TOKEN);
    }
}
