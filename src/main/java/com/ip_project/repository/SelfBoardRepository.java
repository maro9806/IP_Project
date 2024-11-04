package com.ip_project.repository;

import com.ip_project.entity.SelfBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface SelfBoardRepository extends JpaRepository<SelfBoard, Long> {

    // username으로 직접 찾기
    List<SelfBoard> findByUsername(String username);

    @Query("SELECT sb FROM SelfBoard sb WHERE sb.selfIdx = :selfIdx")
    Optional<SelfBoard> findBySelfIdx(@Param("selfIdx") Long selfIdx);

    @Query("SELECT sb FROM SelfBoard sb WHERE sb.username = :username ORDER BY sb.selfDate DESC")
    List<SelfBoard> findAllByUsername(@Param("username") String username);

    // 추가된 메서드들
    @Query("SELECT sb FROM SelfBoard sb WHERE sb.selfCompany = :company")
    List<SelfBoard> findAllByCompany(@Param("company") String company);

    @Query("SELECT sb FROM SelfBoard sb WHERE sb.selfPosition = :position")
    List<SelfBoard> findAllByPosition(@Param("position") String position);

    @Query("SELECT sb FROM SelfBoard sb WHERE sb.selfCompany = :company AND sb.selfPosition = :position")
    List<SelfBoard> findAllByCompanyAndPosition(
            @Param("company") String company,
            @Param("position") String position
    );

    @Query("SELECT sb FROM SelfBoard sb WHERE sb.selfTitle LIKE %:keyword%")
    List<SelfBoard> findAllByTitleContaining(@Param("keyword") String keyword);

    @Query("SELECT sb FROM SelfBoard sb WHERE sb.selfDate BETWEEN :startDate AND :endDate")
    List<SelfBoard> findAllByDateBetween(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate
    );
}