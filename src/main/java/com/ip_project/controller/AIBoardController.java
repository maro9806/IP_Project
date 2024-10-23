package com.ip_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/aiboard")
public class AIBoardController {

    @GetMapping("/ai_board")
    public String aiBoard() {
        return "aiboard/ai_board";  // WEB-INF/views/aiboard/ai_board.jsp를 찾음
    }
}