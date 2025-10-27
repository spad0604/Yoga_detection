package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NotificationRequest {
    private boolean isAll;
    private String userId; // optional when isAll = true
    private String normalTitle;
    private String htmlTitle;
    private String imageUrl;
}
