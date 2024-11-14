package com.ip_project.repository;

import com.ip_project.entity.IntroQuestion;
import com.ip_project.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IntroQuestionRepository extends JpaRepository<IntroQuestion, Long> {
    //질문-답변 가져오기
    List<IntroQuestion> findByReview(Review review);
    void deleteByReview(Review review);
}