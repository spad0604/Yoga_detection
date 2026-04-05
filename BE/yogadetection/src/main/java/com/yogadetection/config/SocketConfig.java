package com.yogadetection.config;

import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOServer;
import org.springframework.context.annotation.Bean;
import org.springframework.beans.factory.annotation.Value;

@org.springframework.context.annotation.Configuration
public class SocketConfig {

    @Value("${socketio.host:0.0.0.0}")
    private String host;

    @Value("${socketio.port:9080}")
    private int port;

    @Value("${socketio.origin:*}")
    private String origin;

    @Bean
    public SocketIOServer socketIOServer() {
        Configuration config = new Configuration();
        config.setHostname(host);
        config.setPort(port);
        config.setOrigin(origin);
        return new SocketIOServer(config);
    }
}
