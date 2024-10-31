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
    @Column(name = "AI_IDX")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IPRO_IDX", referencedColumnName = "IDX")
    private Member member;

    @Column(name = "AI_POSITION", length = 50)
    private String position;

    @Column(name = "AI_DATE")
    private LocalDateTime interviewDate;

    @Column(name = "AI_URL", length = 300)
    private String videoUrl;

    @Enumerated(EnumType.STRING)
    @Column(name = "STATUS")
    private AIInterviewStatus status;

    @OneToMany(mappedBy = "interview", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<AIQuestion> questions = new ArrayList<>();
}