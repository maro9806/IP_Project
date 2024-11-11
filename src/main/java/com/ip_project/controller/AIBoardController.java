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
import lombok.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.InputStreamReader;
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
    private final MemberRepository memberRepository;
    private final VirtualService virtualService;
    private final InterviewQuestionService questionService;

    private static final String PYTHON_SCRIPT_PATH = "C:/Users/USER/Desktop/실전프로젝트/back/IP_Project/Python/interview_generator.py";

    @GetMapping("/ai_board")  // 추가된 매핑
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
        // 현재 사용자 인증 객체에서 username 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName(); // 현재 사용자의 username

        // 디버깅 로그 추가
        System.out.println("Current authenticated username: " + username);

        // username을 통해 Member 엔티티 불러오기
        Member member = memberRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Member not found")); // 에러 핸들링 추가/

        // SelfBoard 저장 (제목, 회사, 직무, 작성일은 자동 생성으로 가정)
        SelfBoard selfBoard = SelfBoard.builder()
                .selfIdx(null) // 시퀀스로 자동 생성되도록 null로 설정
                .selfCompany(selfIntroDto.getCompany())
                .selfTitle(selfIntroDto.getTitle())
                .selfPosition(selfIntroDto.getPosition())
                .selfDate(LocalDateTime.now()) // 현재 날짜로 설정
                .member(member) // Member 추가
                .build();
        // SelfBoard 저장
        selfBoardService.save(selfBoard);

        // SelfIntroduction 객체 저장 (질문 및 답변)
        for (int i = 0; i < selfIntroDto.getQuestions().size(); i++) {
            SelfIntroduction selfIntroduction = SelfIntroduction.builder()
                    .introIdx(null)
                    .introQuestion(selfIntroDto.getQuestions().get(i))
                    .introAnswer(selfIntroDto.getAnswers().get(i))
                    .selfBoard(selfBoard)
                    .build();
            selfIntroductionService.saveSelfIntroduction(selfIntroduction);
        }
        System.out.println("저장이 완료되었습니다.");
        return "redirect:/aiboard/ai_custominfo"; // 저장 후 리다이렉트 페이지 설정
    }

    @GetMapping("/loadSelfIntroduction/{idx}")
    @ResponseBody
    public ResponseEntity<SelfIntroductionDTO> loadSelfIntroduction(@PathVariable("idx") Long idx) {
        try {
            // SelfBoard 조회
            SelfBoard selfBoard = selfBoardService.findById(idx);
            if (selfBoard == null) {
                return ResponseEntity.notFound().build();
            }

            // SelfIntroductionDTO 생성
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
            String command = String.format("cmd.exe /c \"cd /d C:/Users/USER/Desktop/실전프로젝트/back/IP_Project/Python && python interview_generator.py %d\"", selfIdx);

            // 명령어 로깅
            log.info("Executing command: {}", command);

            Process process = Runtime.getRuntime().exec(command);

            Thread.sleep(5000);

            List<Map<String, Object>> questions = questionService.getQuestionsBySelfIdx(selfIdx);
            if (questions != null && !questions.isEmpty()) {
                model.addAttribute("questions", questions);
                return "aiboard/ai_makequestion";
            }

            return "redirect:/aiboard/ai_custominfo";

        } catch (Exception e) {
            log.error("Error in aiMakeQuestion", e);
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

        // 자기소개서 목록 추가
        selfBoardService.listByUsername(model, username);

        return "aiboard/ai_preparation";
    }

    @PostMapping("/api/interview")
    @ResponseBody
    public ResponseEntity<AIInterviewDTO> startInterview(@RequestBody AIInterviewDTO requestDto) {
        try {
            // 로그 추가
            System.out.println("Received request: " + requestDto);

            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            requestDto.setUsername(auth.getName());
            requestDto.setStatus(AIInterviewStatus.CREATED);
            requestDto.setInterviewDate(LocalDateTime.now());

            AIInterviewDTO createdInterview = interviewService.createInterview(requestDto);
            return ResponseEntity.ok(createdInterview);
        } catch (Exception e) {
            e.printStackTrace(); // 에러 로그 추가
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping("/api/interview/{id}/video")
    @ResponseBody
    public ResponseEntity<Void> submitVideo(
            @PathVariable Long id,
            @RequestParam("video") MultipartFile file) {
        interviewService.submitVideoResponse(id, file);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/loadVirtualInterview/{idx}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> loadVirtualInterview(@PathVariable("idx") Long idx) {
        try {
            // SelfBoard 조회
            SelfBoard selfBoard = selfBoardService.findById(idx);
            if (selfBoard == null) {
                return ResponseEntity.notFound().build();
            }

            Map<String, Object> response = new HashMap<>();

            // 기본 정보 설정
            response.put("company", selfBoard.getSelfCompany());
            response.put("position", selfBoard.getSelfPosition());
            response.put("title", selfBoard.getSelfTitle());

            // 예상 질문 목록 추가
            List<Map<String, Object>> questions = virtualService.getInterviewQuestions();
            response.put("questions", questions);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping("/api/virtual/interview")
    @ResponseBody
    public ResponseEntity<AIInterviewDTO> startVirtualInterview(@RequestBody AIInterviewDTO requestDto) {
        try {
            // 질문 개수 검증 (1-6개)
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

    @GetMapping("/executeCommand")
    public String executeCommand(@RequestParam Long selfIdx) {
        try {
            String command = String.format("cmd.exe /c start cmd.exe /k \"cd C:/Users/USER/Desktop/실전프로젝트/back/IP_project/python && python interview_generator.py %d\"", selfIdx);
            Process process = Runtime.getRuntime().exec(command);
            return "redirect:/aiboard/ai_custominfo";
        } catch (Exception e) {
            log.error("Error executing command", e);
            return "redirect:/aiboard/ai_custominfo";
        }
    }
}