package com.ip_project.service;

import lombok.RequiredArgsConstructor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AnswerService {
    private final JdbcTemplate jdbcTemplate;

    public String getAnswer(Long selfIdx, Integer questionNumber) {
        String sql = "SELECT IPRO_ANSWER FROM INTERVIEW_PRO " +
                "WHERE SELF_IDX = ? AND IPRO_IDX = ?";

        try {
            return jdbcTemplate.queryForObject(sql, String.class, selfIdx, questionNumber);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
}