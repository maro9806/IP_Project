package com.ip_project.controller;

import com.ip_project.dto.AIInterviewDTO;
import com.ip_project.dto.SelfIntroductionDTO;
import com.ip_project.entity.*;
import com.ip_project.repository.MemberRepository;
import com.ip_project.service.AIInterviewService;
import com.ip_project.service.SelfBoardService;
import com.ip_project.service.SelfIntroductionService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@Controller
@RequestMapping("/aiboard")
@RequiredArgsConstructor
public class AIBoardController {

    private final AIInterviewService interviewService;
    private final SelfIntroductionService selfIntroductionService;
    private final SelfBoardService selfBoardService;

    @GetMapping("/ai_board")
    public String aiBoard() {
        return "aiboard/ai_board";
    }

    @GetMapping("/ai_custominfo")
    public String aiCustomInfo(Model model) {
        // 현재 사용자 인증 객체에서 username 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName(); // 현재 사용자의 username
        selfBoardService.listByUsername(model, username);
        return "aiboard/ai_custominfo";
    }

    @PostMapping("/saveIntroduction")
    public String saveIntroduction(@ModelAttribute SelfIntroductionDTO selfIntroDto) {
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth == null) {
                log.error("Authentication is null");
                throw new RuntimeException("Authentication not found");
            }

            CustomUser customUser = (CustomUser) auth.getPrincipal();
            Member member = customUser.getMember();

            if (member == null) {
                log.error("Member is null in CustomUser");
                throw new RuntimeException("Member not found in CustomUser");
            }

            log.info("Found member: {}", member.toString());

            // SelfBoard 생성 - member 대신 username 사용
            SelfBoard selfBoard = SelfBoard.builder()
                    .selfCompany(selfIntroDto.getCompany())
                    .selfTitle(selfIntroDto.getTitle())
                    .selfPosition(selfIntroDto.getPosition())
                    .selfDate(LocalDateTime.now())
                    .username(member.getUsername())  // member 대신 username 사용
                    .build();

            // SelfBoard 저장
            log.info("Attempting to save SelfBoard with title: {}", selfBoard.getSelfTitle());
            selfBoard = selfBoardService.save(selfBoard);
            log.info("Successfully saved SelfBoard with ID: {}", selfBoard.getSelfIdx());

            // SelfIntroduction 저장
            for (int i = 0; i < selfIntroDto.getQuestions().size(); i++) {
                String question = selfIntroDto.getQuestions().get(i);
                String answer = selfIntroDto.getAnswers().get(i);

                log.info("Saving question {}: {}", i + 1, question);

                SelfIntroduction selfIntroduction = SelfIntroduction.builder()
                        .introQuestion(question)
                        .introAnswer(answer)
                        .selfIdx(selfBoard.getSelfIdx())  // selfIdx 설정 추가
                        .selfBoard(selfBoard)  // 연관관계를 위해 추가
                        .build();

                selfIntroductionService.saveSelfIntroduction(selfIntroduction);
                log.info("Saved answer for question {}", i + 1);
            }

            return "redirect:/aiboard/ai_custominfo";

        } catch (Exception e) {
            log.error("Error in saveIntroduction:", e);
            throw e;
        }
    }

    @GetMapping("/ai_makequestion")
    public String aiMakeQuestion() {
        return "aiboard/ai_makequestion";
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

        // 자기소개서 목록 추가
        selfBoardService.listByUsername(model, username);

        return "aiboard/ai_preparation";
    }

    @PostMapping("/api/interview")
    @ResponseBody
    public ResponseEntity<AIInterviewDTO> startInterview(@RequestBody AIInterviewDTO requestDto) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        requestDto.setUsername(auth.getName());
        requestDto.setVideoStatus("CREATED");  // Enum 대신 String 사용
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

    @GetMapping("/loadSelfIntroduction/{selfIdx}")
    @ResponseBody
    public ResponseEntity<?> loadSelfIntroduction(@PathVariable Long selfIdx) {
        try {
            // 자기소개서 정보를 담을 DTO
            Map<String, Object> response = new HashMap<>();

            // self_board 테이블에서 정보 조회
            SelfBoard selfBoard = selfBoardService.findBySelfIdx(selfIdx);
            response.put("title", selfBoard.getSelfTitle());
            response.put("company", selfBoard.getSelfCompany());
            response.put("position", selfBoard.getSelfPosition());

            // self_introduction 테이블에서 해당 self_idx의 모든 질문/답변 조회
            List<Map<String, String>> introductions = selfIntroductionService.findAllBySelfIdx(selfIdx);
            response.put("introductions", introductions);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }
}