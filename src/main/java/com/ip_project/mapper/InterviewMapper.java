package com.ip_project.mapper;

import com.ip_project.dto.InterviewDTO;
import com.ip_project.dto.QuestionDTO;
import com.ip_project.entity.Interview;
import com.ip_project.entity.Question;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class InterviewMapper {

    // DTO를 Entity로 변환
    public Interview toEntity(InterviewDTO dto) {
        if (dto == null) {
            return null;
        }

        Interview interview = new Interview();
        interview.setId(dto.getId());
        interview.setApplicantName(dto.getApplicantName());
        interview.setPosition(dto.getPosition());
        interview.setInterviewDate(dto.getInterviewDate());
        interview.setStatus(dto.getStatus());

        if (dto.getQuestions() != null) {
            List<Question> questions = dto.getQuestions().stream()
                    .map(this::questionDtoToEntity)
                    .peek(question -> question.setInterview(interview))
                    .collect(Collectors.toList());
            interview.setQuestions(questions);
        }

        return interview;
    }

    // Entity를 DTO로 변환
    public InterviewDTO toDto(Interview entity) {
        if (entity == null) {
            return null;
        }

        List<QuestionDTO> questionDTOs = entity.getQuestions().stream()
                .map(this::questionEntityToDto)
                .collect(Collectors.toList());

        return InterviewDTO.builder()
                .id(entity.getId())
                .applicantName(entity.getApplicantName())
                .position(entity.getPosition())
                .interviewDate(entity.getInterviewDate())
                .status(entity.getStatus())
                .questions(questionDTOs)
                .build();
    }

    // Question DTO를 Entity로 변환
    private Question questionDtoToEntity(QuestionDTO dto) {
        if (dto == null) {
            return null;
        }

        Question question = new Question();
        question.setId(dto.getId());
        question.setContent(dto.getContent());
        question.setOrderNumber(dto.getOrderNumber());
        return question;
    }

    // Question Entity를 DTO로 변환
    private QuestionDTO questionEntityToDto(Question entity) {
        if (entity == null) {
            return null;
        }

        return QuestionDTO.builder()
                .id(entity.getId())
                .content(entity.getContent())
                .orderNumber(entity.getOrderNumber())
                .build();
    }
}