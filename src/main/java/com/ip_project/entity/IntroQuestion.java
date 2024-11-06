package com.ip_project.entity;
import jakarta.persistence.*;
import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString(exclude = "review")
public class IntroQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "INTRO_SEQ")
    @SequenceGenerator(name = "INTRO_SEQ", sequenceName = "INTRO_SEQ", allocationSize = 1)
    @Column(name = "INTRO_IDX")
    private Long introIdx;

    @Column(name = "INTRO_QUESTION")
    private String introQuestion;

    @Column(name = "INTRO_ANSWER")
    private String introAnswer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "REVIEW_IDX")
    private Review review;
}

