package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
public class CorBoard {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BOARD_SEQ")
    @SequenceGenerator(name = "BOARD_SEQ", sequenceName = "BOARD_SEQ", allocationSize = 1)
    private Long idx;

    private String title;

    private String content;

    @Column(columnDefinition = "TIMESTAMP DEFAULT SYSTIMESTAMP")
    private LocalDateTime indate;


}
