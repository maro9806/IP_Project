package com.ip_project.controller;

import com.ip_project.dto.AIInterviewDTO;
import com.ip_project.entity.AIInterviewStatus;
import com.ip_project.service.AIInterviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.Map;

@Controller
@RequestMapping("/aiboard")
@RequiredArgsConstructor
public class AIBoardController {

    private final AIInterviewService interviewService;

    @GetMapping("/ai_board")  // 추가된 매핑
    public String aiBoard() {
        return "aiboard/ai_board";
    }

    @GetMapping("/ai_preparation")
    public String showInterviewPrep(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("member", Map.of("name", username));
        return "aiboard/ai_preparation";
    }

    @PostMapping("/api/interview")  // 이 경로를 클라이언트에서도 동일하게 사용해야 함
    @ResponseBody
    public ResponseEntity<AIInterviewDTO> startInterview(@RequestBody AIInterviewDTO requestDto) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        requestDto.setUsername(auth.getName());
        requestDto.setStatus(AIInterviewStatus.CREATED);
        requestDto.setInterviewDate(LocalDateTime.now());

        AIInterviewDTO createdInterview = interviewService.createInterview(requestDto);
        return ResponseEntity.ok(createdInterview);
    }

    @PostMapping("/api/interview/{id}/video")
    @ResponseBody
    public ResponseEntity<Void> submitVideo(
            @PathVariable Long id,
            @RequestParam("video") MultipartFile file) {
        interviewService.submitVideoResponse(id, file);
        return ResponseEntity.ok().build();
    }
}