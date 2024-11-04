package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REVIEW_SEQ")
    @SequenceGenerator(name = "REVIEW_SEQ", sequenceName = "REVIEW_SEQ", allocationSize = 1)
    @Column(name = "REVIEW_IDX", nullable = false)
    private Long reviewIdx;

    @Column(name = "REVIEW_TITLE", nullable = false, length = 255)
    private String reviewTitle;

    @Column(name = "REVIEW_CONTENT", nullable = false, length = 2000)
    private String reviewContent;

    @Column(name = "REVIEW_DATE", nullable = false)
    private LocalDateTime reviewDate;

    @Column(name = "RREVIEW_COMPANY", nullable = false, length = 255)
    private String reviewCompany;

    @Column(name = "REVIEW_DATE", nullable = false, length = 255)
    private String reviewPosition;

    @Column(name = "REVIEW_COUNT", nullable = false, length = 255)
    private Long count;


    @ManyToOne
    @JoinColumn(name = "USERNAME", referencedColumnName = "USERNAME")
    private Member member;

    @PrePersist
    protected void onCreate() {
        this.reviewDate = LocalDateTime.now();  // 엔티티가 처음 생성될 때 현재 시간 설정
    }
}
