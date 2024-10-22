package com.ip_project.controller;

import com.ip_project.entity.CorBoard;
import com.ip_project.service.CorBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cor_board")
@Controller
public class CorBoardController {

    @Autowired
    public CorBoardService service;

    @RequestMapping("/list")
    public String list(Model model) {
        service.list(model);
        return "/list";
    }

    @RequestMapping("/get")
    public String get(Model model, Long id) {
        CorBoard board = service.get(id);
        model.addAttribute("board", board);
        return "/cor_board";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        CorBoard board = new CorBoard();
        model.addAttribute("board", board);
        return "/register";
    }

    @RequestMapping("/remove")
    public String remove(Model model, Long id) {
        service.remove(id);
        return "/list";
    }

}
