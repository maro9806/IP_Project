package com.ip_project.repository;

import com.ip_project.entity.Interview;
import com.ip_project.entity.InterviewStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface InterviewRepository extends JpaRepository<Interview, Long> {
    // 기본 CRUD 메소드는 JpaRepository에서 제공

    // 필요한 경우 추가 쿼리 메소드
    List<Interview> findByStatus(InterviewStatus status);
    List<Interview> findByApplicantNameContaining(String name);
    List<Interview> findByInterviewDateBetween(LocalDateTime start, LocalDateTime end);
}