package com.ip_project.repository;

import com.ip_project.entity.InterviewPro;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface InterviewProRepository extends JpaRepository<InterviewPro, Long> {
    // username으로 모든 인터뷰 조회 (최신순)
    List<InterviewPro> findByUsernameOrderByCreatedAtDesc(String username);

    // username으로 최신 인터뷰 조회
    Optional<InterviewPro> findTopByUsernameOrderByCreatedAtDesc(String username);
}