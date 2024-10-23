package com.ip_project.controller;

import com.ip_project.dto.InterviewDTO;
import com.ip_project.dto.QuestionDTO;
import com.ip_project.service.InterviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/interviews")
@RequiredArgsConstructor
public class InterviewController {
    private final InterviewService interviewService;

    @PostMapping
    public ResponseEntity<InterviewDTO> createInterview(@RequestBody InterviewDTO interviewDTO) {
        InterviewDTO createdInterview = interviewService.createInterview(interviewDTO);
        return ResponseEntity.ok(createdInterview);
    }

    @PostMapping("/{id}/video")
    public ResponseEntity<Void> uploadVideo(
            @PathVariable Long id,
            @RequestParam("video") MultipartFile file) {
        interviewService.submitVideoResponse(id, file);
        return ResponseEntity.ok().build();
    }
}