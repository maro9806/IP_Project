package com.ip_project.repository;

import com.ip_project.entity.AIInterview;
import com.ip_project.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AIInterviewRepository extends JpaRepository<AIInterview, Long> {
    List<AIInterview> findByMember(Member member);
}