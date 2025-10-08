package com.yogadetection.dto.request;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class ChangeInformationRequest {
    private String email;
    private String firstName;
    private String lastName;
    private LocalDate dob;
}