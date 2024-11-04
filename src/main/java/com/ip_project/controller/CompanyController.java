package com.ip_project.controller;

import com.ip_project.entity.Company;
import com.ip_project.entity.Swot;
import com.ip_project.service.CompanyService;
import com.ip_project.service.SwotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/company")
@Controller
public class CompanyController {

    @Autowired
    public CompanyService service;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private SwotService swotService;

    @RequestMapping("/corpmain")
    public String list(Model model) {
        service.list(model);
        return "company/corpmain";
    }

    @GetMapping("/corp")
    public String corp(@RequestParam("companyIdx") Long companyIdx, Model model) {
        Company board = companyService.get(companyIdx);
        model.addAttribute("board", board);
        Swot swot = swotService.findByCompanyIdx(companyIdx);
        model.addAttribute("swot", swot);

        return "company/corp";
    }


}
