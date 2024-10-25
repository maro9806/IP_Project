package com.ip_project.dto;

import com.ip_project.entity.InterviewStatus;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InterviewDTO {
    private Long id;
    private String applicantName;
    private String position;
    private LocalDateTime interviewDate;
    private InterviewStatus status;
    private List<QuestionDTO> questions;
}
