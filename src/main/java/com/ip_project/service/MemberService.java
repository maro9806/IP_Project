package com.ip_project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ip_project.entity.Member;
import com.ip_project.repository.MemberRepository;

@Service
public class MemberService {

    @Autowired
    private MemberRepository repository;

    private final PasswordEncoder encoder;

    @Autowired
    public MemberService(PasswordEncoder passwordEncoder) {
        this.encoder = passwordEncoder;
    }

    public void join(Member vo) {
        vo.setPassword(encoder.encode(vo.getPassword()));
        repository.save(vo); //db에 저장

    }

}