package com.ip_project.controller;

import com.ip_project.entity.CorBoard;
import com.ip_project.service.CorBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cor_board")
@Controller
public class CorBoardController {

    @Autowired
    public CorBoardService service;

    @RequestMapping("/list")
    public String list(Model model) {
        service.list(model);
        return "cor_board/list";
    }

    @GetMapping("/corp")
    public String corp(Model model) {
        CorBoard board = new CorBoard();
        model.addAttribute("board", board);
        return "cor_board/corp";
    }

}
