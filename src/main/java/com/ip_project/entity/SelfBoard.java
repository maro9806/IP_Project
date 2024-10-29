package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
public class SelfBoard {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SELF_BOARD_SEQ")
    @SequenceGenerator(name = "SELF_BOARD_SEQ", sequenceName = "SELF_BOARD_SEQ", allocationSize = 1)
    @Column(name = "SELF_IDX", nullable = true, length = 255)
    private Long selfidx;

    @Column(name = "SELF_TITLE", nullable = true, length = 255)
    private String selftitle;

    @Column(name = "SELF_COMPANY", nullable = true, length = 255)
    private String selfcompany;

    @Column(name = "SELF_POSITION", nullable = true, length = 255)
    private String selfposition;


    @Column(name = "SELF_DATE", columnDefinition = "TIMESTAMP DEFAULT SYSTIMESTAMP")
    private LocalDateTime selfDate;

    @ManyToOne
    @JoinColumn(name = "USERNAME", referencedColumnName = "USERNAME")
    private Member member;

}