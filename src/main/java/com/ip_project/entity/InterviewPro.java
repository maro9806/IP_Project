package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.Data;

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

    @ManyToOne
    @JoinColumn(name = "INTERVIEW_IDX", referencedColumnName = "INTERVIEW_IDX")
    private InterviewBoard interviewBoard;
}