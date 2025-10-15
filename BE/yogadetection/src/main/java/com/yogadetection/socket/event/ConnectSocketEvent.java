package com.yogadetection.socket.event;

import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.ConnectListener;
import org.springframework.stereotype.Controller;

import static com.yogadetection.config.SocketServer.CONNECTION_STATE;

@Controller
public class ConnectSocketEvent implements ConnectListener {

    @Override
    public void onConnect(SocketIOClient socketIOClient) {
        String userId = socketIOClient.getHandshakeData().getUrlParams().get("user_id").get(0);
        CONNECTION_STATE.put(userId, socketIOClient.getSessionId().toString());
    }
}
