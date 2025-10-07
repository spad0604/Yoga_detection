package com.yogadetection.exception;

import com.yogadetection.config.ErrorCode;

public class IllegalArgumentException extends BaseException {

    public IllegalArgumentException() {
        super(ErrorCode.INTERNAL_SERVER_ERROR);
    }
}
