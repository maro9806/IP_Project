package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "MEMBER")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBER_SEQ")
    @SequenceGenerator(name = "MEMBER_SEQ", sequenceName = "MEMBER_SEQ", allocationSize = 1)
    @Column(name = "IDX", nullable = false, precision = 19)
    private Long idx;

    @Column(name = "USERNAME", nullable = false, length = 30)
    private String username;

    @Column(name = "PASSWORD", nullable = false, length = 100)
    private String password;

    @Column(name = "NAME", nullable = false, length = 100)
    private String name;

    @Column(name = "EMAIL", nullable = false, length = 40)
    private String email;

    @Column(name = "PHONE", nullable = true, length = 13)
    private String phone;

    @Column(name = "INDATE", nullable = false)
    private LocalDateTime indate;

    @Builder
    public Member(String username, String password, String name, String email, String phone, LocalDateTime indate) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.indate = indate;

    }
}