package com.yogadetection.exception;

import lombok.Getter;

@Getter
public abstract class BaseException extends RuntimeException {

    private final int errorCode;

    public BaseException(int errorCode) {
        this.errorCode = errorCode;
    }

}
