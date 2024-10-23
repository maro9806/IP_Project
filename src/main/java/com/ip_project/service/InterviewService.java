package com.ip_project.service;

import com.ip_project.dto.InterviewDTO;
import com.ip_project.dto.QuestionDTO;
import com.ip_project.entity.Interview;
import com.ip_project.entity.InterviewStatus;
import com.ip_project.mapper.InterviewMapper;
import com.ip_project.repository.InterviewRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.transaction.annotation.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InterviewService {
    private final InterviewRepository interviewRepository;
    private final InterviewMapper interviewMapper;
    private final VideoStorageService videoStorageService;

    @Transactional
    public InterviewDTO createInterview(InterviewDTO dto) {
        Interview interview = interviewMapper.toEntity(dto);
        Interview savedInterview = interviewRepository.save(interview);
        return interviewMapper.toDto(savedInterview);
    }

    @Transactional
    public void submitVideoResponse(Long interviewId, MultipartFile file) {
        Interview interview = interviewRepository.findById(interviewId)
                .orElseThrow(() -> new EntityNotFoundException("Interview not found with id: " + interviewId));

        String videoUrl = videoStorageService.store(file);
        interview.setVideoUrl(videoUrl);
        interview.setStatus(InterviewStatus.SUBMITTED);
    }

    @Transactional(readOnly = true)
    public InterviewDTO getInterview(Long id) {
        Interview interview = interviewRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Interview not found with id: " + id));
        return interviewMapper.toDto(interview);
    }

    @Transactional(readOnly = true)
    public List<InterviewDTO> getAllInterviews() {
        return interviewRepository.findAll().stream()
                .map(interviewMapper::toDto)
                .toList();
    }

    @Transactional
    public void deleteInterview(Long id) {
        if (!interviewRepository.existsById(id)) {
            throw new EntityNotFoundException("Interview not found with id: " + id);
        }
        interviewRepository.deleteById(id);
    }
}