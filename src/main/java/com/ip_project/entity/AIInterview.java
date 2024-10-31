package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "AI_INTERVIEW")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AIInterview {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "AI_INTERVIEW_SEQ")
    @SequenceGenerator(name = "AI_INTERVIEW_SEQ", sequenceName = "AI_INTERVIEW_SEQ", allocationSize = 1)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_username", referencedColumnName = "username")
    private Member member;

    @Column(name = "position")
    private String position;

    @Column(name = "interview_date")
    private LocalDateTime interviewDate;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private AIInterviewStatus status;

    @Column(name = "video_url")
    private String videoUrl;

    @OneToMany(mappedBy = "interview", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<AIQuestion> questions = new ArrayList<>();
}