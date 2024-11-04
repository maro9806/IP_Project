package com.ip_project.controller;

import com.ip_project.entity.InterviewBoard;
import com.ip_project.service.InterviewBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/interview_board")
public class InterviewBoardController {

    @Autowired
    private InterviewBoardService service;

    // 모든 InterviewBoard 레코드를 리스트 형태로 보여주는 GET 요청 처리
    @GetMapping("/list")
    public String list(Model model) {
        service.list(model);
        return "interview_board/list";
    }

    // 특정 InterviewBoard 레코드의 상세 정보를 보여주는 GET 요청 처리
    @GetMapping("/detail/{interviewIdx}")
    public String detail(@PathVariable Long interviewIdx, Model model) {
        InterviewBoard board = service.get(interviewIdx);
        model.addAttribute("board", board);
        return "interview_board/detail";
    }

    // 새로운 InterviewBoard 레코드를 등록하기 위한 폼을 보여주는 GET 요청 처리
    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("board", new InterviewBoard());
        return "interview_board/register";
    }

    // 새로운 InterviewBoard 레코드를 저장하는 POST 요청 처리
    @PostMapping("/register")
    public String register(InterviewBoard board) {
        service.register(board);
        return "redirect:/interview_board/list";
    }

    // 특정 ID의 InterviewBoard 레코드를 삭제하는 GET 요청 처리
    @GetMapping("/delete/{interviewIdx}")
    public String delete(@PathVariable Long interviewIdx) {
        service.remove(interviewIdx);
        return "redirect:/interview_board/list";
    }
}