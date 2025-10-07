package com.yogadetection.exception;

import com.yogadetection.config.ErrorCode;

public class UnauthorizedException extends BaseException {

    public UnauthorizedException() {
        super(ErrorCode.UNAUTHORIZED_ERROR);
    }
}
