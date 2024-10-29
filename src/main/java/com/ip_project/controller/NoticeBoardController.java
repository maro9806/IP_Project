package com.ip_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeBoardController {

    @GetMapping("/noticeboard")
    public String noticeboard() {
        return "notice/noticeboard";
    }
}
