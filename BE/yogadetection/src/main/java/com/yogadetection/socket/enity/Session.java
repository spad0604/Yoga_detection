package com.yogadetection.socket.enity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Session {
    private String sessionId;
    private Integer state;
}
