package com.yogadetection.service.impl;

import com.yogadetection.entity.User;
import com.yogadetection.service.JwtService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Service
public class JwtServiceImpl implements JwtService {
//    private static final String SECRET_KEY = System.getenv("JWT_SECRET");
    private static final String SECRET_KEY = "404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970";
    private static final long EXPIRATION_TIME = 86400000; 
    private static final long REFRESH_EXPIRATION_TIME = 604800000; 

    @Override
    public String generateToken(User user) {
        Map<String, Object> extraClaims = new HashMap<>();
        extraClaims.put("username", user.getUsername());
        extraClaims.put("type", "access");
        String token = generateToken(extraClaims, user, EXPIRATION_TIME);
        return token;
    }

    @Override
    public String generateRefreshToken(User user) {
        Map<String, Object> extraClaims = new HashMap<>();
        extraClaims.put("username", user.getUsername());
        extraClaims.put("type", "refresh");
        String token = generateToken(extraClaims, user, REFRESH_EXPIRATION_TIME);
        return token;
    }

    private String cleanToken(String token) {
        if (token == null) {
            return "";
        }
        token = token.trim();
        if (token.startsWith("Bearer ")) {
            token = token.substring(7).trim();
        }
        return token;
    }

    private String generateToken(Map<String, Object> extraClaims, User user, long expirationTime) {
        return Jwts
                .builder()
                .setClaims(extraClaims)
                .setId(user.getId())
                .setSubject(user.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + expirationTime))
                .signWith(getSigningKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    @Override
    public String extractUsername(String token) {
        token = cleanToken(token);
        return extractClaim(token, Claims::getSubject);
    }

    @Override
    public String extractUserId(String token) {
        token = cleanToken(token);
        return extractClaim(token, Claims::getId);
    }

    @Override
    public boolean isTokenValid(String token, User user) {
        final String username = extractUsername(token);
        return (username.equals(user.getUsername())) && !isTokenExpired(token);
    }

    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }

    private boolean isTokenExpired(String token) {
        return extractExpiration(token).before(new Date());
    }

    private <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    private Claims extractAllClaims(String token) {
        return Jwts
                .parser()
                .verifyWith(getSigningKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    private SecretKey getSigningKey() {
        byte[] keyBytes = Decoders.BASE64.decode(SECRET_KEY);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
