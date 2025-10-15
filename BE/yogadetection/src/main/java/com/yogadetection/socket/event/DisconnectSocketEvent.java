package com.yogadetection.socket.event;

import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DisconnectListener;
import org.springframework.stereotype.Controller;

import static com.yogadetection.config.SocketServer.CONNECTION_STATE;

@Controller
public class DisconnectSocketEvent implements DisconnectListener {

    @Override
    public void onDisconnect(SocketIOClient socketIOClient) {
        String userId = socketIOClient.getHandshakeData().getUrlParams().get("user_id").get(0);
        CONNECTION_STATE.remove(userId);
    }
}
