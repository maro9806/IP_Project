package com.ip_project.service;

import com.ip_project.entity.InterviewPro;
import com.ip_project.repository.InterviewProRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class InterviewProService {
    private final InterviewProRepository repository;

    // 인터뷰 보드 ID로 모든 인터뷰 조회
    public List<InterviewPro> listByInterviewBoard(Long interviewIdx) {
        return repository.findByInterviewBoardOrderByIproIdxDesc(interviewIdx);
    }

    // 모든 InterviewPro 레코드를 조회하여 모델에 추가
    public void list(Model model) {
        List<InterviewPro> list = repository.findAll();
        model.addAttribute("list", list);
    }

    // 특정 ID로 InterviewPro 레코드 조회
    public InterviewPro get(Long iproIdx) {
        return repository.findById(iproIdx).orElse(null);
    }

    // 새로운 InterviewPro 레코드 저장
    public void register(InterviewPro pro) {
        repository.save(pro);
    }
}