package com.ip_project.repository;

import com.ip_project.entity.InterviewBoard;
import org.springframework.data.jpa.repository.JpaRepository;

// InterviewBoard 엔터티를 위한 Repository 인터페이스로, JpaRepository를 상속하여 CRUD 기능 제공
public interface InterviewBoardRepository extends JpaRepository<InterviewBoard, Long> {
}