package com.config;

import jakarta.persistence.criteria.CriteriaBuilder;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class ErrorCode {
    public static final int SUCCESS = 200;
    public static final int UNKNOWN_ERROR = 400;
    public static final int UNAUTHORIZED_ERROR = 401;
    public static final int FORBIDDEN = 403;
    public static final int NOT_FOUND = 404;
    public static final int INTERNAL_SERVER_ERROR = 500;
}
