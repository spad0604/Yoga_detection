package com.yogadetection.socket.event;

import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DisconnectListener;
import com.yogadetection.utils.ParamKey;
import org.springframework.stereotype.Controller;

import static com.yogadetection.config.SocketServer.CONNECTION_STATE;

@Controller
public class DisconnectSocketEvent implements DisconnectListener {

    @Override
    public void onDisconnect(SocketIOClient socketIOClient) {
        String userId = socketIOClient.get(ParamKey.USER_ID);
        if (userId != null) {
            CONNECTION_STATE.remove(userId);
        }
        else {
            System.out.println("Cannot found user from the socket");
        }
    }
}
