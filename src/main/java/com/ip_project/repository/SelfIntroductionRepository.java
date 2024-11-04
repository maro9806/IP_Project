package com.ip_project.repository;

import com.ip_project.entity.SelfBoard;
import com.ip_project.entity.SelfIntroduction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SelfIntroductionRepository extends JpaRepository<SelfIntroduction, Long> {

    @Query("SELECT si FROM SelfIntroduction si WHERE si.selfIdx = :selfIdx")
    List<SelfIntroduction> findAllBySelfIdx(@Param("selfIdx") Long selfIdx);
}