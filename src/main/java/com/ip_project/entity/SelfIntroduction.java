package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "SELF_INTRODUCTION")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SelfIntroduction {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SELF_INTRO_SEQ")
    @SequenceGenerator(name = "SELF_INTRO_SEQ", sequenceName = "SELF_INTRO_SEQ", allocationSize = 1)
    @Column(name = "self_intro_id")
    private Long selfIntroId;

    @Column(name = "self_title", length = 50, nullable = false)
    private String selfTitle;

    @Column(name = "date_create")
    private LocalDateTime dateCreate;

    @Column(name = "self_content1", length = 1500, nullable = false)
    private String selfContent1;

    @Column(name = "self_content2", length = 1500, nullable = false)
    private String selfContent2;

    @Column(name = "self_content3", length = 1500, nullable = false)
    private String selfContent3;

    @Column(name = "self_content4", length = 1500)
    private String selfContent4;

    @Column(name = "self_content5", length = 1500)
    private String selfContent5;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idx")
    private Member member;
}