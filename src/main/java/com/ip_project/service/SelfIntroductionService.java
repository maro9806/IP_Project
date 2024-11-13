package com.ip_project.service;

import com.ip_project.dto.SelfIntroductionDTO;
import com.ip_project.entity.SelfBoard;
import com.ip_project.entity.SelfIntroduction;
import com.ip_project.repository.SelfIntroductionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class SelfIntroductionService {

    @Autowired
    private SelfIntroductionRepository selfIntroductionRepository;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public SelfIntroductionDTO getSelfIntroductions(SelfBoard selfBoard) {
        List<SelfIntroduction> selfIntroductions = selfIntroductionRepository.findAllBySelfBoard(selfBoard);

        SelfIntroductionDTO dto = new SelfIntroductionDTO();
        dto.setIdx(selfBoard.getSelfIdx());
        dto.setDate(selfBoard.getSelfDate());
        dto.setTitle(selfBoard.getSelfTitle());
        dto.setCompany(selfBoard.getSelfCompany());
        dto.setPosition(selfBoard.getSelfPosition());

        List<String> questions = new ArrayList<>();
        List<String> answers = new ArrayList<>();

        // 기존 자기소개서 질문/답변 설정
        for (SelfIntroduction intro : selfIntroductions) {
            questions.add(intro.getIntroQuestion());
            answers.add(intro.getIntroAnswer());
        }
        dto.setQuestions(questions);
        dto.setAnswers(answers);

        // INTERVIEW_PRO 테이블에서 예상 질문/답변 가져오기
        String sql = "SELECT IPRO_QUESTION, IPRO_ANSWER FROM INTERVIEW_PRO " +
                "WHERE SELF_IDX = ? ORDER BY IPRO_IDX";

        List<Map<String, Object>> results = jdbcTemplate.queryForList(sql, selfBoard.getSelfIdx());

        List<String> iproQuestions = new ArrayList<>();
        List<String> iproAnswers = new ArrayList<>();

        for (Map<String, Object> row : results) {
            iproQuestions.add((String) row.get("IPRO_QUESTION"));
            iproAnswers.add((String) row.get("IPRO_ANSWER"));
        }

        dto.setIproQuestions(iproQuestions);
        dto.setIproAnswers(iproAnswers);

        return dto;
    }

    public void saveSelfIntroduction(SelfIntroduction selfIntroduction) {
        selfIntroductionRepository.save(selfIntroduction);
    }

    @Transactional
    public void deleteSelfIntroduction(SelfBoard selfBoard) {
        selfIntroductionRepository.deleteBySelfBoard(selfBoard);
    }

    public List<SelfIntroduction> findBySelfBoard(SelfBoard selfBoard) {
        return selfIntroductionRepository.findAllBySelfBoard(selfBoard);
    }
}