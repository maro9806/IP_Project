package com.ip_project.service;

import com.ip_project.entity.InterviewPro;
import com.ip_project.repository.InterviewProRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
public class InterviewProService {

    @Autowired
    private InterviewProRepository repository;

    // 모든 InterviewPro 레코드를 조회하여 모델에 추가하는 메서드
    public void list(Model model) {
        List<InterviewPro> list = repository.findAll();
        model.addAttribute("list", list);
    }

    // 특정 ID를 통해 InterviewPro 레코드를 조회하는 메서드
    public InterviewPro get(Long iproIdx) {
        Optional<InterviewPro> pro = repository.findById(iproIdx);
        return pro.orElse(null);
    }

    // 새로운 InterviewPro 레코드를 저장하는 메서드
    public void register(InterviewPro pro) {
        repository.save(pro);
    }
}