package com.yogadetection.exception;


import com.yogadetection.config.ErrorCode;

public class EntityNotFoundException extends BaseException {
    public EntityNotFoundException() {
        super(ErrorCode.NOT_FOUND);
    }
}
