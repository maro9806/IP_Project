package com.ip_project.controller;

import com.ip_project.dto.AIInterviewDTO;
import com.ip_project.dto.SelfIntroductionDTO;
import com.ip_project.entity.AIInterviewStatus;
import com.ip_project.entity.Member;
import com.ip_project.entity.SelfBoard;
import com.ip_project.entity.SelfIntroduction;
import com.ip_project.repository.MemberRepository;
import com.ip_project.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

@Slf4j
@Controller
@RequestMapping("/aiboard")
@RequiredArgsConstructor
public class AIBoardController {

    private final AIInterviewService interviewService;
    private final SelfIntroductionService selfIntroductionService;
    private final SelfBoardService selfBoardService;
    private final MemberRepository memberRepository;
    private final VirtualService virtualService;
    private final InterviewQuestionService questionService;
    private final RestTemplate restTemplate;

    private static final String FASTAPI_URL = "http://127.0.0.1:8000/generate-interview";

    @GetMapping("/ai_board")
    public String aiBoard() {
        return "aiboard/ai_board";
    }

    @GetMapping("/ai_custominfo")
    public String aiCustomInfo(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        selfBoardService.listByUsername(model, username);
        return "aiboard/ai_custominfo";
    }

    @PostMapping("/saveIntroduction")
    public String saveIntroduction(@ModelAttribute SelfIntroductionDTO selfIntroDto) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Member member = memberRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Member not found"));

        SelfBoard selfBoard = SelfBoard.builder()
                .selfCompany(selfIntroDto.getCompany())
                .selfTitle(selfIntroDto.getTitle())
                .selfPosition(selfIntroDto.getPosition())
                .selfDate(LocalDateTime.now())
                .member(member)
                .build();

        selfBoardService.save(selfBoard);

        for (int i = 0; i < selfIntroDto.getQuestions().size(); i++) {
            SelfIntroduction selfIntroduction = SelfIntroduction.builder()
                    .introQuestion(selfIntroDto.getQuestions().get(i))
                    .introAnswer(selfIntroDto.getAnswers().get(i))
                    .selfBoard(selfBoard)
                    .build();
            selfIntroductionService.saveSelfIntroduction(selfIntroduction);
        }

        return "redirect:/aiboard/ai_custominfo";
    }

    @GetMapping("/loadSelfIntroduction/{idx}")
    @ResponseBody
    public ResponseEntity<SelfIntroductionDTO> loadSelfIntroduction(@PathVariable("idx") Long idx) {
        try {
            SelfBoard selfBoard = selfBoardService.findById(idx);
            if (selfBoard == null) {
                return ResponseEntity.notFound().build();
            }

            SelfIntroductionDTO dto = selfIntroductionService.getSelfIntroductions(selfBoard);
            return ResponseEntity.ok(dto);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/ai_makequestion")
    public String aiMakeQuestion(@RequestParam(name = "selfIdx", required = true) Long selfIdx, Model model) {
        log.info("Starting interview question generation for selfIdx: {}", selfIdx);
        try {
            // FastAPI 서버로 요청을 보내서 새로운 질문 생성
            Map<String, Long> requestBody = new HashMap<>();
            requestBody.put("self_idx", selfIdx);

            // FastAPI 호출
            ResponseEntity<Map> response = restTemplate.postForEntity(
                    FASTAPI_URL,
                    requestBody,
                    Map.class
            );

            if (response.getStatusCode() == HttpStatus.OK) {
                // 새로 생성된 질문 조회
                List<Map<String, Object>> questions = questionService.getQuestionsBySelfIdx(selfIdx);
                if (questions != null && !questions.isEmpty()) {
                    model.addAttribute("questions", questions);
                    return "aiboard/ai_makequestion";
                }
            }

            // 질문 생성 실패 시
            log.error("Failed to generate questions for selfIdx: {}", selfIdx);
            model.addAttribute("error", "질문 생성에 실패했습니다.");
            return "redirect:/aiboard/ai_custominfo";

        } catch (Exception e) {
            log.error("Error in aiMakeQuestion for selfIdx: {}", selfIdx, e);
            model.addAttribute("error", "오류가 발생했습니다.");
            return "redirect:/aiboard/ai_custominfo";
        }
    }

    @GetMapping("/ai_question")
    public String aiQuestion() {
        return "aiboard/ai_question";
    }

    @GetMapping("/ai_check")
    public String aiCheck() {
        return "aiboard/ai_check";
    }

    @GetMapping("/ai_preparation")
    public String showInterviewPrep(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("member", Map.of("name", username));
        selfBoardService.listByUsername(model, username);
        return "aiboard/ai_preparation";
    }

    @PostMapping("/api/interview")
    @ResponseBody
    public ResponseEntity<AIInterviewDTO> startInterview(@RequestBody AIInterviewDTO requestDto) {
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            requestDto.setUsername(auth.getName());
            requestDto.setStatus(AIInterviewStatus.CREATED);
            requestDto.setInterviewDate(LocalDateTime.now());

            AIInterviewDTO createdInterview = interviewService.createInterview(requestDto);
            return ResponseEntity.ok(createdInterview);
        } catch (Exception e) {
            log.error("Error starting interview", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping("/api/interview/{id}/video")
    @ResponseBody
    public ResponseEntity<Void> submitVideo(@PathVariable Long id, @RequestParam("video") MultipartFile file) {
        interviewService.submitVideoResponse(id, file);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/api/virtual/interview")
    @ResponseBody
    public ResponseEntity<AIInterviewDTO> startVirtualInterview(@RequestBody AIInterviewDTO requestDto) {
        try {
            if (requestDto.getQuestions() == null ||
                    requestDto.getQuestions().size() < 1 ||
                    requestDto.getQuestions().size() > 6) {
                return ResponseEntity.badRequest().build();
            }

            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            requestDto.setUsername(auth.getName());
            requestDto.setStatus(AIInterviewStatus.CREATED);
            requestDto.setInterviewDate(LocalDateTime.now());

            AIInterviewDTO createdInterview = interviewService.createInterview(requestDto);
            return ResponseEntity.ok(createdInterview);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}