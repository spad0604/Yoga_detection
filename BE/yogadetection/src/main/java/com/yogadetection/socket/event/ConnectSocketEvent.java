package com.yogadetection.socket.event;

import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.ConnectListener;
import com.yogadetection.service.JwtService;
import com.yogadetection.utils.ParamKey;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;

import static com.yogadetection.config.SocketServer.CONNECTION_STATE;

@Controller
@AllArgsConstructor
public class ConnectSocketEvent implements ConnectListener {

    private final JwtService jwtService;

    @Override
    public void onConnect(SocketIOClient socketIOClient) {
        String token = socketIOClient.getHandshakeData().getHttpHeaders().get(ParamKey.AUTHORIZATION);
        String userId = null;
        if(token != null) {
            userId = jwtService.extractUserId(token);
        }
        if(userId == null || userId.isEmpty()) {
            socketIOClient.disconnect();
        }
        socketIOClient.set(ParamKey.USER_ID, userId);
        CONNECTION_STATE.put(userId, socketIOClient.getSessionId().toString());
    }
}
