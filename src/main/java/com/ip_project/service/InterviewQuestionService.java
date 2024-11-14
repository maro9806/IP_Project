package com.ip_project.service;

import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class InterviewQuestionService {
    private final JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getQuestionsBySelfIdx(Long selfIdx) {
        String sql = "SELECT IPRO_IDX, IPRO_QUESTION, IPRO_TYPE, IPRO_ANSWER FROM INTERVIEW_PRO WHERE SELF_IDX = ? ORDER BY IPRO_IDX";
        return jdbcTemplate.queryForList(sql, selfIdx);
    }
    // 새로 추가된 답변 저장 메소드
    public int saveAnswer(Long iproIdx, String iproAnswer) {
        String sql = "UPDATE INTERVIEW_PRO SET IPRO_ANSWER = ? WHERE IPRO_IDX = ?";
        return jdbcTemplate.update(sql, iproAnswer, iproIdx);
    }

}
