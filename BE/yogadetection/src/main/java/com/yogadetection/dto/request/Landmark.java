package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Landmark {
    private String type;
    private double x;
    private double y;
    private double z;
}
