package com.ip_project.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AnswerService {
    private final JdbcTemplate jdbcTemplate;

    public String getAnswer(Long selfIdx, Integer questionNumber) {
        String sql = "SELECT ip.IPRO_ANSWER " +
                "FROM INTERVIEW_PRO ip " +
                "JOIN INTERVIEW_BOARD ib ON ip.INTERVIEW_IDX = ib.INTERVIEW_IDX " +
                "JOIN SELF_BOARD sb ON ib.SELF_IDX = sb.SELF_IDX " +
                "WHERE sb.SELF_IDX = ? AND ip.IPRO_IDX = ?";

        try {
            log.debug("Querying answer with selfIdx: {}, questionNumber: {}", selfIdx, questionNumber);
            String answer = jdbcTemplate.queryForObject(sql, String.class, selfIdx, questionNumber);
            log.debug("Found answer: {}", answer);
            return answer;
        } catch (EmptyResultDataAccessException e) {
            log.debug("No answer found for selfIdx: {}, questionNumber: {}", selfIdx, questionNumber);
            return null;
        } catch (Exception e) {
            log.error("Error querying answer", e);
            throw e;
        }
    }

    public List<String> getQuestions(Long selfIdx) {
        String sql = "SELECT ip.IPRO_QUESTION " +
                "FROM INTERVIEW_PRO ip " +
                "JOIN INTERVIEW_BOARD ib ON ip.INTERVIEW_IDX = ib.INTERVIEW_IDX " +
                "JOIN SELF_BOARD sb ON ib.SELF_IDX = sb.SELF_IDX " +
                "WHERE sb.SELF_IDX = ? " +
                "ORDER BY ip.IPRO_IDX";

        try {
            log.debug("Querying questions for selfIdx: {}", selfIdx);
            List<String> questions = jdbcTemplate.queryForList(sql, String.class, selfIdx);
            log.debug("Found {} questions", questions.size());
            return questions;
        } catch (Exception e) {
            log.error("Error querying questions", e);
            throw e;
        }
    }
}