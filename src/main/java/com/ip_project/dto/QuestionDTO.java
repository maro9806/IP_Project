package com.ip_project.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;


@Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public class QuestionDTO {
        private Long id;
        private String content;
        private Integer orderNumber;
    }

