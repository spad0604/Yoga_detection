package com.exception;


import com.config.ErrorCode;

public class EntityNotFoundException extends BaseException {
    public EntityNotFoundException(String message) {
        super(ErrorCode.NOT_FOUND);
    }
}
