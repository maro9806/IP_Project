package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "SELF_BOARD")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SelfBoard {

    @Id
    @Column(name = "SELF_IDX")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long selfIdx;

    @Column(name = "SELF_TITLE", length = 250, nullable = false)
    private String selfTitle;

    @Column(name = "SELF_COMPANY", length = 200, nullable = false)
    private String selfCompany;

    @Column(name = "SELF_POSITION", length = 250, nullable = false)
    private String selfPosition;

    @Column(name = "SELF_DATE", nullable = false)
    private LocalDateTime selfDate;

    @Column(name = "USERNAME", length = 30, nullable = false)
    private String username;  // Member 엔티티 대신 username 문자열 사용

    @Builder.Default
    @OneToMany(mappedBy = "selfBoard", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SelfIntroduction> introductions = new ArrayList<>();

    public void addIntroduction(SelfIntroduction introduction) {
        introductions.add(introduction);
        introduction.setSelfBoard(this);
    }
}