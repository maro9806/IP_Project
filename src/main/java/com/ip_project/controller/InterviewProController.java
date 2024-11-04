package com.ip_project.controller;

import com.ip_project.entity.InterviewPro;
import com.ip_project.service.InterviewProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/interview_pro")
public class InterviewProController {

    @Autowired
    private InterviewProService service;

    // 모든 InterviewPro 레코드를 리스트 형태로 보여주는 GET 요청 처리
    @GetMapping("/list")
    public String list(Model model) {
        service.list(model);
        return "interview_pro/list";
    }

    // 특정 InterviewPro 레코드의 상세 정보를 보여주는 GET 요청 처리
    @GetMapping("/detail/{iproIdx}")
    public String detail(@PathVariable Long iproIdx, Model model) {
        InterviewPro pro = service.get(iproIdx);
        model.addAttribute("pro", pro);
        return "interview_pro/detail";
    }

    // 새로운 InterviewPro 레코드를 등록하기 위한 폼을 보여주는 GET 요청 처리
    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("pro", new InterviewPro());
        return "interview_pro/register";
    }

    // 새로운 InterviewPro 레코드를 저장하는 POST 요청 처리
    @PostMapping("/register")
    public String register(InterviewPro pro) {
        service.register(pro);
        return "redirect:/interview_pro/list";
    }
}
