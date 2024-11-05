package com.ip_project.controller;

import com.ip_project.service.AIInterviewService;
import com.ip_project.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MyPageController {
    private final AIInterviewService interviewService;
    private final MemberService memberService;

    @GetMapping("/mypage")
    public String myPage(Model model) {
        // 현재 로그인한 사용자의 username 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        // 해당 사용자의 면접 목록 가져오기
        model.addAttribute("interviews", interviewService.getInterviewsByUsername(username));
        return "mypage/mypage";
    }

    @GetMapping("/mypageint")
    public String myPageIntroduction(Model model) {
        return "mypage/mypageint";
    }

    @GetMapping("/mypagevid")
    public String myPageInterview(Model model) {
        return "mypage/mypagevid";
    }

    @GetMapping("/myprofile")
    public String myPageMember(Model model) {
        return "mypage/myprofile";
    }

    @GetMapping("/mypagelist")
    public String myPageList(Model model) {
        return "mypage/mypagelist";
    }


}