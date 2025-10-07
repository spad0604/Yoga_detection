package com.yogadetection.service;

public interface TokenBlackListService {
    void blacklistToken(String token);
    boolean isTokenBlacklisted(String token);
}
