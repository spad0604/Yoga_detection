package com.yogadetection.exception;

import com.yogadetection.config.ErrorCode;

public class PasswordsDoNotMatchException extends BaseException {
    public  PasswordsDoNotMatchException() {
        super(ErrorCode.PASSWORDS_DO_NOT_MATCH);
    }
}
