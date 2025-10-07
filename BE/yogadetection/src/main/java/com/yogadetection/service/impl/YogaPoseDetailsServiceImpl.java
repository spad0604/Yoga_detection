package com.yogadetection.service.impl;

import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.service.YogaPoseDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("yogaPoseDetailsService")
@RequiredArgsConstructor
public class YogaPoseDetailsServiceImpl implements YogaPoseDetailsService {
    private final YogaPoseDetailsRepository yogaPoseDetailsRepository;

    @Override
    public Page<YogaPoseDetails> getListYogaPose(int page, int pageSize, String keyWord) {
        int pageIndex = Math.max(0, page);
        int size = Math.max(1, pageSize);
        Pageable pageable = PageRequest.of(pageIndex, size);
        return yogaPoseDetailsRepository.getListYogaPose(keyWord, pageable);
    }

    @Override
    public YogaPoseDetails getYogaPoseDetails(String code) {
        YogaPoseDetails details = yogaPoseDetailsRepository.getYogaPoseDetails(code);
        if (details == null) {
            throw new EntityNotFoundException("Yoga pose not found with code: " + code);
        }
        return details;
    }
}
