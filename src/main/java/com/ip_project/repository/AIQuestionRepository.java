package com.ip_project.repository;

import com.ip_project.entity.AIQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AIQuestionRepository extends JpaRepository<AIQuestion, Long> {
    List<AIQuestion> findByInterviewIdOrderByOrderNumber(Long interviewId);

    // 추가: 인터뷰 ID와 질문 번호로 질문 찾기
    Optional<AIQuestion> findByInterviewIdAndOrderNumber(Long interviewId, Integer orderNumber);
}