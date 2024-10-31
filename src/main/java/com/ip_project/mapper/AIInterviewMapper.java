package com.ip_project.mapper;

import com.ip_project.dto.AIInterviewDTO;
import com.ip_project.dto.AIQuestionDTO;
import com.ip_project.entity.AIInterview;
import com.ip_project.entity.AIQuestion;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class AIInterviewMapper {

    public AIInterview toEntity(AIInterviewDTO dto) {
        if (dto == null) {
            return null;
        }

        AIInterview interview = new AIInterview();
        interview.setId(dto.getId());
        // Member는 서비스 계층에서 설정
        interview.setPosition(dto.getPosition());
        interview.setInterviewDate(dto.getInterviewDate());
        interview.setStatus(dto.getStatus());
        interview.setVideoUrl(dto.getVideoUrl());

        if (dto.getQuestions() != null) {
            List<AIQuestion> questions = dto.getQuestions().stream()
                    .map(this::questionToEntity)
                    .collect(Collectors.toList());
            questions.forEach(q -> q.setInterview(interview));
            interview.setQuestions(questions);
        }

        return interview;
    }

    public AIInterviewDTO toDto(AIInterview entity) {
        if (entity == null) {
            return null;
        }

        return AIInterviewDTO.builder()
                .id(entity.getId())
                .username(entity.getMember() != null ? entity.getMember().getUsername() : null)
                .position(entity.getPosition())
                .interviewDate(entity.getInterviewDate())
                .status(entity.getStatus())
                .videoUrl(entity.getVideoUrl())
                .questions(entity.getQuestions().stream()
                        .map(this::questionToDto)
                        .collect(Collectors.toList()))
                .build();
    }

    private AIQuestion questionToEntity(AIQuestionDTO dto) {
        if (dto == null) {
            return null;
        }

        return AIQuestion.builder()
                .id(dto.getId())
                .content(dto.getContent())
                .orderNumber(dto.getOrderNumber())
                .questionType(dto.getQuestionType())
                .answer(dto.getAnswer())
                .build();
    }

    private AIQuestionDTO questionToDto(AIQuestion entity) {
        if (entity == null) {
            return null;
        }

        return AIQuestionDTO.builder()
                .id(entity.getId())
                .content(entity.getContent())
                .orderNumber(entity.getOrderNumber())
                .questionType(entity.getQuestionType())
                .answer(entity.getAnswer())
                .build();
    }
}