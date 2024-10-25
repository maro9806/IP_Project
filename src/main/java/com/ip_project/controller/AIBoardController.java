package com.ip_project.controller;

import org.springframework.ui.Model;  // Model import 수정
import com.ip_project.dto.InterviewDTO;
import com.ip_project.service.InterviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/aiboard")
@RequiredArgsConstructor  // 생성자 주입을 위한 어노테이션 추가
public class AIBoardController {

    private final InterviewService interviewService;  // 서비스 주입

    @GetMapping("/ai_board")
    public String aiBoard() {
        return "aiboard/ai_board";
    }

    @GetMapping("/ai_custominfo")
    public String aiCustomInfo() {
        return "aiboard/ai_custominfo";
    }


    @GetMapping("/ai_check")
    public String aiCheck() {
        return "aiboard/ai_check";
    }

    @GetMapping("/ai_question")
    public String aiQuestion() {
        return "aiboard/ai_question";
    }

    @GetMapping("/ai_preparation")
    public String showInterviewPrep(Model model) {
        // 사용자 정보와 자소서 목록 등을 모델에 추가
        return "aiboard/ai_preparation";
    }

    @PostMapping("/api/interview")    // 클라이언트 코드와 경로 일치
    @ResponseBody
    public ResponseEntity<InterviewDTO> startInterview(@RequestBody InterviewDTO interviewDTO) {
        InterviewDTO createdInterview = interviewService.createInterview(interviewDTO);
        return ResponseEntity.ok(createdInterview);
    }

    @PostMapping("/api/interview/{id}/video")    // 클라이언트 코드와 경로 일치
    @ResponseBody
    public ResponseEntity<Void> submitVideo(
            @PathVariable Long id,
            @RequestParam("video") MultipartFile file) {
        interviewService.submitVideoResponse(id, file);
        return ResponseEntity.ok().build();
    }


}