package com.ip_project.dto;

import com.ip_project.entity.AIInterviewStatus;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AIInterviewDTO {
    private Long id;
    private String username;  // applicantName 대신 username 사용
    private String position;
    private LocalDateTime interviewDate;
    private AIInterviewStatus status;
    private String videoUrl;
    private List<AIQuestionDTO> questions;
}