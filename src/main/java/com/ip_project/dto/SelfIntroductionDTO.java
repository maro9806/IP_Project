package com.ip_project.dto;

import lombok.Data;

import java.util.List;

@Data
public class SelfIntroductionDTO {
    private String title;
    private String company;
    private String position;
    private List<String> questions;
    private List<String> answers;
}
