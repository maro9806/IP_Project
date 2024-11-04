package com.ip_project.repository;

import com.ip_project.entity.SelfBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SelfBoardRepository extends JpaRepository<SelfBoard, Long> {

    List<SelfBoard> findByUsername(String username);

    @Query("SELECT sb FROM SelfBoard sb WHERE sb.selfIdx = :selfIdx")
    Optional<SelfBoard> findBySelfIdx(@Param("selfIdx") Long selfIdx);

    @Query("SELECT sb FROM SelfBoard sb WHERE sb.username = :username ORDER BY sb.selfDate DESC")
    List<SelfBoard> findAllByUsername(@Param("username") String username);
}