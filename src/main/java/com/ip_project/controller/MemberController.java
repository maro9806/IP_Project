package com.ip_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.ip_project.entity.Member;
import com.ip_project.service.MemberService;
import java.util.Map;
import java.util.HashMap;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService service;

    @GetMapping("/join")
    public String join() {
        return "member/join";
    }

    @PostMapping("/join")
    public String join(Member vo) {
        try {
            service.join(vo);
            return "redirect:/member/login";  // 성공시 로그인 페이지로
        } catch (Exception e) {
            // 실패시 다시 회원가입 페이지로
            return "redirect:/member/join?error=" + e.getMessage();
        }
    }

    @GetMapping("/login")
    public String loginPage() {
        return "member/login";
    }

    // 아이디 중복 확인 API 추가
    @GetMapping("/checkId")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkId(@RequestParam("username") String username) {
        try {
            Map<String, Boolean> response = new HashMap<>();
            boolean isAvailable = service.isUsernameAvailable(username);
            response.put("available", isAvailable);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}