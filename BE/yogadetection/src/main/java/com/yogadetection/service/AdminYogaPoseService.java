package com.yogadetection.service;

import com.yogadetection.dto.request.CreateYogaPoseRequest;
import com.yogadetection.dto.request.UpdateYogaPoseRequest;
import com.yogadetection.entity.YogaPoseDetails;

public interface AdminYogaPoseService {
    YogaPoseDetails createYogaPose(CreateYogaPoseRequest request);
    YogaPoseDetails updateYogaPose(String code, UpdateYogaPoseRequest request);
    void deleteYogaPose(String code);
}
