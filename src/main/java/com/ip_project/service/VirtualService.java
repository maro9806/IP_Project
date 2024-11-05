package com.ip_project.service;

import com.ip_project.entity.InterviewPro;
import com.ip_project.repository.InterviewProRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class VirtualService {
    private final InterviewProRepository interviewProRepository;

    // 예상 질문 목록 조회
    @Transactional(readOnly = true)
    public List<Map<String, Object>> getInterviewQuestions() {
        // 기본 6개 질문 준비
        List<Map<String, Object>> questions = new ArrayList<>();

        // 기업 관련 질문
        questions.add(createQuestion("회사를 선택한 이유는 무엇인가요?", "COMPANY", 1));
        questions.add(createQuestion("우리 회사의 핵심 가치는 무엇이라고 생각하시나요?", "COMPANY", 2));

        // 직무 관련 질문
        questions.add(createQuestion("해당 직무를 선택한 이유는 무엇인가요?", "JOB", 3));
        questions.add(createQuestion("이 직무에서 가장 중요한 역량은 무엇이라고 생각하시나요?", "JOB", 4));

        // 경험 관련 질문
        questions.add(createQuestion("프로젝트 수행 중 어려움을 극복한 경험을 말씀해주세요.", "EXPERIENCE", 5));
        questions.add(createQuestion("팀 프로젝트에서 갈등을 해결한 경험을 말씀해주세요.", "EXPERIENCE", 6));

        return questions;
    }

    private Map<String, Object> createQuestion(String content, String type, int order) {
        Map<String, Object> question = new HashMap<>();
        question.put("content", content);
        question.put("type", type);
        question.put("orderNumber", order);
        return question;
    }
}