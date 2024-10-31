package com.ip_project.controller;

import com.ip_project.entity.Company;
import com.ip_project.service.CompanyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/company")
@RequiredArgsConstructor  // 생성자 주입으로 변경
public class CompanyController {

    private final CompanyService companyService;  // 하나의 서비스 인스턴스만 사용

    @RequestMapping("/corpmain")
    public String list(Model model) {
        companyService.list(model);
        return "company/corpmain";
    }

    @GetMapping("/corp")
    public String corp(@RequestParam(value = "companyIdx", required = false) Long companyIdx, Model model) {
        Company board;
        if (companyIdx != null) {
            // companyIdx가 제공된 경우 해당 회사 정보를 조회
            board = companyService.get(companyIdx);
        } else {
            // companyIdx가 없는 경우 새로운 Company 객체 생성
            board = new Company();
        }
        model.addAttribute("board", board);
        return "company/corp";
    }
}