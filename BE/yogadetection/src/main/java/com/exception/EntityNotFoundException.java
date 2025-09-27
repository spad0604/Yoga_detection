package com.exception;


import com.config.ErrorCode;

public class EntityNotFoundException extends BaseException {
    public EntityNotFoundException() {
        super(ErrorCode.NOT_FOUND);
    }
}
