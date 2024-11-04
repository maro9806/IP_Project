package com.ip_project.service;

import com.ip_project.dto.AIInterviewDTO;
import com.ip_project.entity.AIInterview;
import com.ip_project.entity.AIInterviewStatus;
import com.ip_project.entity.Member;
import com.ip_project.mapper.AIInterviewMapper;
import com.ip_project.repository.AIInterviewRepository;
import com.ip_project.repository.MemberRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.transaction.annotation.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AIInterviewService {
    private final AIInterviewRepository interviewRepository;
    private final AIInterviewMapper interviewMapper;
    private final AIVideoStorageService videoStorageService;

    @Transactional
    public AIInterviewDTO createInterview(AIInterviewDTO dto) {
        AIInterview interview = interviewMapper.toEntity(dto);
        // status를 String으로 직접 설정
        interview.setVideoStatus("CREATED");
        interview.setDate(LocalDateTime.now());

        AIInterview savedInterview = interviewRepository.save(interview);
        return interviewMapper.toDto(savedInterview);
    }

    @Transactional
    public void submitVideoResponse(Long interviewId, MultipartFile file) {
        AIInterview interview = interviewRepository.findById(interviewId)
                .orElseThrow(() -> new EntityNotFoundException("Interview not found with id: " + interviewId));

        String videoUrl = videoStorageService.store(file);
        interview.setUrl(videoUrl);
        interview.setVideoStatus("SUBMITTED");  // String으로 직접 설정
        interview.setVideoSize(file.getSize());
        interview.setVideoFormat(file.getContentType());
        interview.setVideoDuration(0L);
    }

    @Transactional(readOnly = true)
    public AIInterviewDTO getInterview(Long id) {
        AIInterview interview = interviewRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Interview not found with id: " + id));
        return interviewMapper.toDto(interview);
    }

    @Transactional(readOnly = true)
    public List<AIInterviewDTO> getInterviewsByUsername(String username) {
        return interviewRepository.findByUsername(username).stream()
                .map(interviewMapper::toDto)
                .collect(Collectors.toList());
    }

    @Transactional
    public void deleteInterview(Long id) {
        if (!interviewRepository.existsById(id)) {
            throw new EntityNotFoundException("Interview not found with id: " + id);
        }
        interviewRepository.deleteById(id);
    }
}