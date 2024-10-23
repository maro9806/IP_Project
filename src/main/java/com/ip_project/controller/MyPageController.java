package com.ip_project.controller;

import com.ip_project.service.InterviewService;
import com.ip_project.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class MyPageController {
    private final InterviewService interviewService;
    @Autowired
    private MemberService memberService;

    @GetMapping("/mypage")
    public String myPage(Model model) {
        model.addAttribute("interviews", interviewService.getAllInterviews());
        return "mypage"; // mypage.jsp를 찾음
    }

    @GetMapping("/mypageint")
    public String myPageIntroduction(Model model) {
        // 자기소개서 관련 데이터 추가
        return "mypageint";
    }

    @GetMapping("/mypageque")
    public String myPageApplication(Model model) {
        // 기업 지원 현황 데이터 추가
        return "mypageque";
    }

    @GetMapping("/mypagevid")
    public String myPageInterview(Model model) {
        // AI 면접 준비 데이터 추가
        return "mypagevid";
    }
}