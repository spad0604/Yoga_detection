package com.yogadetection.exception;

import com.yogadetection.config.ErrorCode;

public class AccessDeniedException extends BaseException {
    public AccessDeniedException() {
        super(ErrorCode.ACCESS_DENIED);
    }
}
