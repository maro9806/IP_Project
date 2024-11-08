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
        String sql = "SELECT IPRO_IDX, IPRO_QUESTION FROM INTERVIEW_PRO WHERE SELF_IDX = ? ORDER BY IPRO_IDX";
        return jdbcTemplate.queryForList(sql, selfIdx);
    }
}