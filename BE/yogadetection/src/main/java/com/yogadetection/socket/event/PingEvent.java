package com.yogadetection.socket.event;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.service.JwtService;
import com.yogadetection.utils.Constant;
import com.yogadetection.utils.ParamKey;
import lombok.AllArgsConstructor;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;

import static com.yogadetection.config.SocketServer.CONNECTION_STATE;

@Controller
@AllArgsConstructor
public class PingEvent implements DataListener<String> {

    private final JwtService jwtService;

    @Override
    public void onData(SocketIOClient client, String data, AckRequest ackRequest) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        String token = client.getHandshakeData().getUrlParams().get(ParamKey.TOKEN).get(0);
        String userId = jwtService.extractUserId(token);
        if (CONNECTION_STATE.containsKey(userId)) {
            JSONObject dataResponse = new JSONObject();
            dataResponse.put("hello", "loconcac");
            client.sendEvent(Constant.EVENT_NAME.PONG, dataResponse);
        }
    }
}
