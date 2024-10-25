package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Question {
    @Id
    @GeneratedValue
    private Long id;  // 질문 고유 식별자

    private String content;     // 질문 내용
    private Integer orderNumber;  // 질문 순서

    // Question과 Interview는 N:1 관계 (여러 질문이 하나의 면접에 속함)
    @ManyToOne(fetch = FetchType.LAZY)
    // fetch = FetchType.LAZY: 성능 최적화를 위해 필요할 때만 데이터를 로딩
    @JoinColumn(name = "interview_id")
    // interview_id 컬럼을 통해 Interview 테이블과 조인
    private Interview interview;  // 이 질문이 속한 면접
}