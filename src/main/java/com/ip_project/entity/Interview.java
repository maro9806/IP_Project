package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity  // JPA 엔티티임을 명시하는 애노테이션
@Getter @Setter  // Lombok을 사용하여 getter/setter 메소드 자동 생성
public class Interview {
    @Id  // 기본키(Primary Key) 지정
    @GeneratedValue  // 기본키 자동 생성 (AUTO_INCREMENT)
    private Long id;  // 면접 고유 식별자

    private String applicantName;  // 지원자 이름
    private String position;       // 지원 포지션
    private LocalDateTime interviewDate;  // 면접 일시
    private String videoUrl;       // 저장된 영상 파일의 URL
    private InterviewStatus status;  // 면접 상태 (예: 대기중, 진행중, 완료 등)

    // Interview와 Question은 1:N 관계 (하나의 면접에 여러 질문이 있을 수 있음)
    @OneToMany(mappedBy = "interview", cascade = CascadeType.ALL)
    // mappedBy: Question 엔티티의 interview 필드와 매핑
    // cascade: Interview 엔티티의 변경이 관련된 Question 엔티티에도 전파됨
    private List<Question> questions = new ArrayList<>();  // 면접 질문 리스트
}