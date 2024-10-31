package com.ip_project.repository;

import com.ip_project.entity.AIQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AIQuestionRepository extends JpaRepository<AIQuestion, Long> {
    List<AIQuestion> findByInterviewIdOrderByOrderNumber(Long interviewId);
}