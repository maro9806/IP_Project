package com.ip_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ip_project.entity.ReviewBoard;
import com.ip_project.service.ReviewBoardService;
@RequestMapping("/review_board")
@Controller
public class ReviewBoardController {

    @Autowired
    private ReviewBoardService service;


    @RequestMapping("/list")
    public String list(Model model) {
        service.list(model);
        return "/list";
    }

    @RequestMapping("/get")
    public @ResponseBody ReviewBoard get(Long idx) {
        return service.get(idx);
    }


    @RequestMapping("/register")
    public String register(ReviewBoard vo) {
        service.register(vo);
        return "redirect:list";
    }


    @RequestMapping("/remove")
    public String remove(Long idx) {
        service.remove(idx);
        return "redirect:list";
    }

}