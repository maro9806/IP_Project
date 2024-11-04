package com.ip_project.repository;

import com.ip_project.entity.InterviewPro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface InterviewProRepository extends JpaRepository<InterviewPro, Long> {
    // JPQL을 사용한 방법
    @Query("SELECT ip FROM InterviewPro ip WHERE ip.interviewBoard.interviewIdx = :interviewIdx ORDER BY ip.iproIdx DESC")
    List<InterviewPro> findByInterviewBoardOrderByIproIdxDesc(@Param("interviewIdx") Long interviewIdx);

    // 최신 인터뷰 조회
    @Query("SELECT ip FROM InterviewPro ip WHERE ip.interviewBoard.interviewIdx = :interviewIdx ORDER BY ip.iproIdx DESC LIMIT 1")
    Optional<InterviewPro> findTopByInterviewBoardOrderByIproIdxDesc(@Param("interviewIdx") Long interviewIdx);
}