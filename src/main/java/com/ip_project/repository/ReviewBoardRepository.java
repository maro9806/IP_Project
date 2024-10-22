package com.ip_project.repository;

import com.ip_project.entity.ReviewBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewBoardRepository extends JpaRepository<ReviewBoard, Long> {
}
