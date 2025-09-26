package com.config;

import jakarta.persistence.criteria.CriteriaBuilder;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Bean;

@NoArgsConstructor
public class ErrorCode {
    public static final int SUCCESS = 200;
    public static final int INVALID_PASSWORD = 102;
    public static final int USER_NOT_FOUND = 101;
    public static final int EMAIL_ALREADY_EXISTS = 103;
    public static final int INVALID_TOKEN = 104;
    public static final int USER_ALREADY_EXISTS = 100;
    public static final int UNKNOWN_ERROR = 400;
    public static final int UNAUTHORIZED_ERROR = 401;
    public static final int FORBIDDEN = 403;
    public static final int NOT_FOUND = 404;
    public static final int INTERNAL_SERVER_ERROR = 500;
}
