package com.ip_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ip_project.entity.ReviewBoard;
import com.ip_project.service.ReviewBoardService;

import java.util.List;

@Controller
@RequestMapping("/review_board")
public class ReviewBoardController {

    @Autowired
    private ReviewBoardService service;

    @GetMapping("/list")
    public String list(Model model) {
        List<ReviewBoard> list = service.list();
        model.addAttribute("list", list);
        return "review_board/list";
    }

    @GetMapping("/get")
    @ResponseBody
    public ReviewBoard get(@RequestParam Long idx) {
        return service.get(idx);
    }

    @PostMapping("/register")
    public String register(@ModelAttribute ReviewBoard vo) {
        service.register(vo);
        return "redirect:list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam Long idx) {
        service.remove(idx);
        return "redirect:list";
    }
}