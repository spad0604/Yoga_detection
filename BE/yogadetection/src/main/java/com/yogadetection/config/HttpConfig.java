package com.yogadetection.config;

import org.springframework.context.annotation.Configuration;

import java.net.http.HttpClient;

@Configuration
public class HttpConfig {

    private static final HttpClient CLIENT = HttpClient.newHttpClient();
}
