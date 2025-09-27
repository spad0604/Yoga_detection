package com.config;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class ErrorCode {
    public static final int SUCCESS = 200;
    public static final int INVALID_FORMAT = 400;
    public static final int UNAUTHORIZED_ERROR = 401;
    public static final int ACCESS_DENIED = 403;
    public static final int NOT_FOUND = 404;
    public static final int INTERNAL_SERVER_ERROR = 500;
}
