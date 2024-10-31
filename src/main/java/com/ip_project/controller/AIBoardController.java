package com.ip_project.controller;

import com.ip_project.dto.AIInterviewDTO;
import com.ip_project.dto.AIQuestionDTO;
import com.ip_project.entity.AIInterviewStatus;
import com.ip_project.service.AIInterviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.Arrays;
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

        model.addAttribute("member", Map.of("name", "신현준"));
        return "aiboard/ai_preparation";
    }

    @PostMapping("/api/interview")
    @ResponseBody
    public ResponseEntity<AIInterviewDTO> startInterview(@RequestBody AIInterviewDTO requestDto) {
        requestDto.setStatus(AIInterviewStatus.CREATED);
        requestDto.setInterviewDate(LocalDateTime.now());

        // 기본 질문 설정
        requestDto.setQuestions(Arrays.asList(
                AIQuestionDTO.builder()
                        .content("회사를 선택한 이유는 무엇인가요?")
                        .orderNumber(1)
                        .build(),
                AIQuestionDTO.builder()
                        .content("직무와 관련된 경험을 설명해주세요.")
                        .orderNumber(2)
                        .build(),
                AIQuestionDTO.builder()
                        .content("향후 커리어 계획은 무엇인가요?")
                        .orderNumber(3)
                        .build()
        ));

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