package com.yogadetection.dto.request;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreateGroupRequest {
    private String name;
    private String description;
    private String imageUrl;
    private Boolean isPrivate;
    @JsonProperty("createBy")
    @JsonAlias({"createdBy"})
    private String createdBy;
}

