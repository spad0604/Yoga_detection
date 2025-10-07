package com.yogadetection.exception;


import com.yogadetection.config.ErrorCode;

public class EntityNotFoundException extends BaseException {
    public EntityNotFoundException(String s) {
        super(ErrorCode.NOT_FOUND);
    }
}
