package com.ip_project.entity;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {
    private Member member;

    public CustomUser(Member member) {
        super(
                member != null ? member.getUsername() : "",
                member != null ? member.getPassword() : "",
                member != null && member.getRole() != null
                        ? AuthorityUtils.createAuthorityList(member.getRole().toString())
                        : AuthorityUtils.NO_AUTHORITIES
        );
        this.member = member;
    }

    // 기본 생성자
    public CustomUser() {
        super("", "", AuthorityUtils.NO_AUTHORITIES);
    }
}