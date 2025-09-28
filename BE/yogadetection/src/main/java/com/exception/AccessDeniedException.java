package com.exception;

import com.config.ErrorCode;

public class AccessDeniedException extends BaseException {
    public AccessDeniedException() {
        super(ErrorCode.ACCESS_DENIED);
    }
}
