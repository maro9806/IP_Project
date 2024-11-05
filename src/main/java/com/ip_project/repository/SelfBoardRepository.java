package com.ip_project.repository;

import com.ip_project.entity.SelfBoard;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SelfBoardRepository extends JpaRepository<SelfBoard, Long> {

    List<SelfBoard> findByMemberUsername(String username);
}