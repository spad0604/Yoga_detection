package com.yogadetection.config;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.UserService;
import com.yogadetection.socket.event.ConnectSocketEvent;
import com.yogadetection.socket.event.DisconnectSocketEvent;
import com.yogadetection.socket.event.PingEvent;
import com.yogadetection.socket.event.SendMessageEvent;
import com.yogadetection.utils.Constant;
import com.yogadetection.utils.ParamKey;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
@AllArgsConstructor
public class SocketServer {


    private final SocketIOServer server;
    private final SendMessageEvent sendDataEvent;
    private final PingEvent pingEvent;
    private final ConnectSocketEvent connectSocketEvent;
    private final DisconnectSocketEvent disconnectSocketEvent;

    private final JwtService jwtService;

    public static final Map<String, String> CONNECTION_STATE = new HashMap<>();

    public void start() {
        server.addEventListener(Constant.EVENT_NAME.SEND_DATA, String.class, sendDataEvent);
        server.addEventListener(Constant.EVENT_NAME.PING, String.class, pingEvent);
        server.addConnectListener(connectSocketEvent);
        server.addDisconnectListener(disconnectSocketEvent);
        server.start();
    }

    public void stop() {
        server.stop();
    }

    private String getUserId(SocketIOClient client) {
        String token = client.getHandshakeData().getUrlParams().get(ParamKey.TOKEN).get(0);
        return jwtService.extractUserId(token);
    }

    public void onConnect(SocketIOClient socketIOClient) {
        String userId = getUserId(socketIOClient);
        CONNECTION_STATE.put(userId, socketIOClient.getSessionId().toString());
    }

    public void onDisconnect(SocketIOClient socketIOClient) {
        String userId = getUserId(socketIOClient);
        CONNECTION_STATE.remove(userId);
    }
}
