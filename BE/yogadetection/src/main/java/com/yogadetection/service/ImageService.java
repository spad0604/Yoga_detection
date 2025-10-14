package com.yogadetection.service;

import java.time.OffsetDateTime;
import java.time.ZonedDateTime;

public interface ImageService {

    public ZonedDateTime convertToVNTime(OffsetDateTime utcTime);
}
