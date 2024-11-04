package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "SELF_INTRODUCTION")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SelfIntroduction {

    @Id
    @Column(name = "INTRO_IDX")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long introIdx;

    @Column(name = "INTRO_QUESTION", length = 1000, nullable = false)
    private String introQuestion;

    @Column(name = "INTRO_ANSWER", length = 2000)
    private String introAnswer;

    @Column(name = "SELF_IDX", nullable = false)
    private Long selfIdx;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SELF_IDX", referencedColumnName = "SELF_IDX", insertable = false, updatable = false)
    private SelfBoard selfBoard;
}