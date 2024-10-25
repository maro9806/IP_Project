package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "REVIEW_BOARD")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewBoard {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REVIEW_SEQ")
    @SequenceGenerator(name = "REVIEW_SEQ", sequenceName = "REVIEW_SEQ", allocationSize = 1)
    private Long idx;

    @Column(name = "COMPANY_NAME", length = 50)
    private String companyName;

    @Column(name = "TITLE", length = 50)
    private String title;

    @Column(name = "CONTENT", length = 5000)
    private String content;

    @Column(name = "CREATE_DATE")
    private LocalDateTime createDate;

    @Column(name = "WRITER", length = 50)
    private String writer;

    @Column(name = "VIEW_COUNT")
    private Integer viewCount;
}