package com.ip_project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ip_project.entity.CustomUser;
import com.ip_project.entity.Member;
import com.ip_project.repository.MemberRepository;

@Service
public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService{
    // Spring Security와 Repository(Mapper)을 연결해주는 클래스

    @Autowired
    private MemberRepository repository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // SpringSecurity가 자동으로 로그인 기능을 사용하고 나서 실행되는 메소드
        // 로그인을 실행하고나서 로그인정보가 일치했을때 username에는 로그인 성공한 사람의 id가
        // 아니라면 null이 담기게 된다

        Member member = repository.findById(username).get();

        if(member == null) {
            throw new UsernameNotFoundException(username + "없음");
        }

        return new CustomUser(member); // 로그인 성공시 해당 Member를 Spring Security Context에 등록해야한다
    }






}

