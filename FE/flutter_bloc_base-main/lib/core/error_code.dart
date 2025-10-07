enum ErrorCode {
  SUCCESS(200, 'Success'),
  INVALID_PASSWORD(102, 'Invalid password'),
  USER_NOT_FOUND(101, 'User not found'),
  EMAIL_ALREADY_IN_USE(103, 'Email already in use'),
  INVALID_TOKEN(104, 'Invalid token'),
  USER_ALREADY_EXISTS(100, 'User already exists'),
  INVALID_FORMAT(400, 'Invalid format'),
  UNAUTHORIZED(401, 'Unauthorized'),
  ACCESS_DENIED(403, 'Access denied'),
  NOT_FOUND(404, 'Not found'),
  INTERNAL_SERVER_ERROR(500, 'Internal server error'),
  OTP_EXPIRED(410, 'OTP expired'),
  OTP_INCORRECT(411, 'OTP incorrect');

  final int code;
  final String message;

  const ErrorCode(this.code, this.message);
}
