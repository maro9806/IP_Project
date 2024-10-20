package com.ip_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ip_project.entity.Member;
import com.ip_project.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService service;

    @GetMapping("/join")
    public String join() {
        return "member/join";
    }

    @PostMapping("/join")
    public String join(Member vo) {
        service.join(vo);
        return "redirect:/member/join";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "member/login";
    }

}