package com.ip_project.repository;

import java.util.Optional;
import java.util.List;

import com.ip_project.entity.AIInterview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AIInterviewRepository extends JpaRepository<AIInterview, Long> {
    List<AIInterview> findByUsername(String username);
    Optional<AIInterview> findTopByUsernameOrderByDateDesc(String username);
}