package com.ip_project.controller;

import com.ip_project.dto.AIInterviewDTO;
import com.ip_project.dto.SelfIntroductionDTO;
import com.ip_project.entity.AIInterviewStatus;
import com.ip_project.entity.Member;
import com.ip_project.entity.SelfBoard;
import com.ip_project.entity.SelfIntroduction;
import com.ip_project.repository.MemberRepository;
import com.ip_project.service.AIInterviewService;
import com.ip_project.service.SelfBoardService;
import com.ip_project.service.SelfIntroductionService;
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
    private final SelfIntroductionService selfIntroductionService;
    private final SelfBoardService selfBoardService;
    private final MemberRepository memberRepository;

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
    @ResponseBody // 이 어노테이션은 AJAX 요청에 JSON 응답을 보내기 위해 필요합니다.
    public SelfIntroductionDTO loadSelfIntroduction(@PathVariable Long idx) {
        // 선택된 SelfBoard의 idx로 SelfIntroduction 가져오기
        SelfBoard selfBoard = selfBoardService.findById(idx);

        if (selfBoard != null) {
            return selfIntroductionService.getSelfIntroductions(selfBoard); // DTO를 직접 반환
        } else {
            // selfBoard가 없을 경우에 대한 처리
            throw new IllegalArgumentException("SelfBoard not found");
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
    public String aiCheck() { return "aiboard/ai_check";}


    @GetMapping("/ai_preparation")
    public String showInterviewPrep(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("member", Map.of("name", username));

        // 자기소개서 목록 추가
        selfBoardService.listByUsername(model, username);

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