package com.ip_project.dto;

import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.List;


@Data
@NoArgsConstructor
public class SelfIntroductionDTO {
    private String company;
    private String title;
    private String position;
    private List<String> questions;
    private List<String> answers;
    private List<String> iproQuestions; // 추가된 필드
}