package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
    private String password;
    private String email;
    private String phone;
    private String join_date;

    @Enumerated(EnumType.STRING)
    private Role role;

    // Lombok이 자동으로 getter 메서드를 생성하지만,
    // 명시적으로 추가할 수도 있습니다.


}