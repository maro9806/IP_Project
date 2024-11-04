package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Data
@Entity
public class InterviewPro {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "IPRO_SEQ")
    @SequenceGenerator(name = "IPRO_SEQ", sequenceName = "IPRO_SEQ", allocationSize = 1)
    @Column(name = "IPRO_IDX", nullable = false)
    private Long iproIdx;

    @Column(name = "IPRO_QUESTION", length = 255, nullable = false)
    private String iproQuestion;

    @Column(name = "IPRO_ANSWER", length = 4000)
    private String iproAnswer;

    @Column(name = "CREATED_AT")
    @CreationTimestamp
    private LocalDateTime createdAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "INTERVIEW_IDX", referencedColumnName = "INTERVIEW_IDX")
    private InterviewBoard interviewBoard;

    // getters and setters
}