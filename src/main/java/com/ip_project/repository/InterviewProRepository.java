package com.ip_project.repository;

import com.ip_project.entity.InterviewPro;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InterviewProRepository extends JpaRepository<InterviewPro, Long> {
    List<InterviewPro> findByMemberUsername(String username);
}
