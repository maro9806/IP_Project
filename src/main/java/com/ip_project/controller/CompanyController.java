package com.ip_project.controller;

import com.ip_project.entity.Company;
import com.ip_project.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/company")
@Controller
public class CompanyController {

    @Autowired
    public CompanyService service;

    @RequestMapping("/corpmain")
    public String list(Model model) {
        service.list(model);
        return "company/corpmain";
    }

    @GetMapping("/corp")
    public String corp(Model model) {
        Company board = new Company();
        model.addAttribute("board", board);
        return "company/corp";
    }

}
