package com.ip_project.dto;

import com.ip_project.entity.AIInterviewStatus;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AIInterviewDTO {
    private Long id;
    private String username;
    private String position;
    private LocalDateTime interviewDate;
    private String videoStatus;
    private String videoUrl;
    private Long memberId;
    private List<AIQuestionDTO> questions;
    private String videoFormat;
    private Long videoSize;

    public void setStatus(AIInterviewStatus status) {
        this.videoStatus = status.name();
    }
}