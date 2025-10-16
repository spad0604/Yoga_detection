package com.yogadetection.socket.event;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.yogadetection.utils.Constant;
import com.yogadetection.utils.ParamKey;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;


@Controller
public class SendMessageEvent implements DataListener<String> {

    @Override
    public void onData(SocketIOClient client, String data, AckRequest ackRequest) throws Exception {
        String userId = client.get(ParamKey.USER_ID);
        if (userId == null) {
            client.disconnect();
            return;
        }
        Map<String, Object> dataResponse = new HashMap<>();
        client.sendEvent(Constant.EVENT_NAME.RESPONSE_DATA, dataResponse);
    }
}
