package com.ip_project.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "USER_INFORMATION")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserInformation {
    @Id
    private Long idx;

    @Column(length = 250, nullable = false)
    private String education;

    @Column(name = "user_career", length = 250)
    private String userCareer;

    @Column(name = "self_intro_num")
    private Integer selfIntroNum;

    @Column(name = "user_skill", length = 100)
    private String userSkill;

    @Column(name = "user_photo", length = 250)
    private String userPhoto;

    @Column(name = "hope_location", length = 30, nullable = false)
    private String hopeLocation;

    @Column(name = "hope_salary", length = 50, nullable = false)
    private String hopeSalary;

    @Column(name = "hope_job_type", length = 50, nullable = false)
    private String hopeJobType;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    @JoinColumn(name = "idx")
    private Member member;
}