package com.service.impl;

import com.service.TokenBlackListService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Map;

@Service
@AllArgsConstructor
public class TokenBlackListServiceImpl implements TokenBlackListService {
    private final Map<String, Long> blackList;
    private static final String SECRET_KEY = "404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970";

    private SecretKey getSigningKey() {
        byte[] keyBytes = Decoders.BASE64.decode(SECRET_KEY);
        return Keys.hmacShaKeyFor(keyBytes);
    }

    @Override
    public void blacklistToken(String token) {
        if (isTokenBlacklisted(token)) {
            String key = SECRET_KEY;
            return;
        }
        try {
            Claims claims = Jwts
                    .parser()
                    .verifyWith(getSigningKey())
                    .build()
                    .parseSignedClaims(token)
                    .getPayload();

            blackList.put(token, claims.getExpiration().getTime());
        } catch (JwtException e) {
            return;
        }
    }

    @Override
    public boolean isTokenBlacklisted(String token) {
        if (blackList.containsKey(token)) {
            long blackListTime = blackList.get(token);
            if (System.currentTimeMillis() < blackListTime) {
                return true;
            } else {
                blackList.remove(token);
                return false;
            }
        }
        return false;
    }

    @Scheduled(fixedRate = 60 * 60 * 1000)
    public void cleanupExpiredTokens() {
        long now = System.currentTimeMillis();
        blackList.entrySet().removeIf(entry -> now > entry.getValue());
    }

}
