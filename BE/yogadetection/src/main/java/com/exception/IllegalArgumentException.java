package com.exception;

import com.config.ErrorCode;

public class IllegalArgumentException extends BaseException {

    public IllegalArgumentException() {
        super(ErrorCode.INTERNAL_SERVER_ERROR);
    }
}
