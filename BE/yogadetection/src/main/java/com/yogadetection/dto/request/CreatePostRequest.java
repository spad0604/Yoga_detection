package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreatePostRequest {
    private String content;
    private String visibility; // PUBLIC or FRIENDS (optional for group, required for social)
}


