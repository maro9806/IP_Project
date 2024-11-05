package com.ip_project.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class SelfIntroductionDTO {
    private Long idx;
    private LocalDateTime date;
    private String title;
    private String company;
    private String position;
    private List<String> questions;
    private List<String> answers;
}
