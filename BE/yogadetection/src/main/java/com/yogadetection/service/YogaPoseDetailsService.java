package com.yogadetection.service;

import com.yogadetection.entity.YogaPoseDetails;
import org.springframework.data.domain.Page;

public interface YogaPoseDetailsService {
    Page<YogaPoseDetails> getListYogaPose(int page, int pageSize, String keyWord);
    YogaPoseDetails getYogaPoseDetails(String code);
}
