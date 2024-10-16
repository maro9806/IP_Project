package com.ip_project.entity;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Column;


import lombok.Data;
@Data
@Entity // Hibernate가 아래 vo 설계대로 테이블을 생성하기 위한 키워드
public class Board {

    @Id // Primary-key 설정
    @GeneratedValue(strategy = GenerationType.IDENTITY) // == Auto_increment
    private Long idx; // 게시글 번호

    private String title; // 제목

    @Column(length = 2000) // 컬럼의 길이 조절 /안했을때 default =255
    private String content; // 내용

    @Column(updatable = false) // 수정할때 작성자는 수정이 안되게 하겠다
    private String writer; // 작성자

    @Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
    //날짜는 입력할때 기본값으로 now() 함수를 사용하며 수정이 안되게 하겠다
    private Date indate; // 날짜

    @Column(updatable = false, insertable = false, columnDefinition = "int default 0")
    private Long count; // 조회수

}