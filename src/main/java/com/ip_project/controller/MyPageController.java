package com.ip_project.controller;

import com.ip_project.service.InterviewService;
import com.ip_project.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MyPageController {
    private final InterviewService interviewService;
    private final MemberService memberService;

    @GetMapping("/mypage")
    public String myPage(Model model) {
        model.addAttribute("interviews", interviewService.getAllInterviews());
        return "mypage/mypage";  // 경로 수정
    }

    @GetMapping("/mypageint")
    public String myPageIntroduction(Model model) {
        return "mypage/mypageint";  // 경로 수정
    }

    @GetMapping("/mypagevid")
    public String myPageInterview(Model model) {
        return "mypage/mypagevid";  // 경로 수정
    }

    @GetMapping("/myprofile")
    public String myPageMember(Model model) {
        return "mypage/myprofile";
    }
}