package com.ip_project.service;

import com.ip_project.entity.InterviewBoard;
import com.ip_project.repository.InterviewBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
public class InterviewBoardService {

    @Autowired
    private InterviewBoardRepository repository;

    // 모든 InterviewBoard 레코드를 조회하여 모델에 추가하는 메서드
    public void list(Model model) {
        List<InterviewBoard> list = repository.findAll();
        model.addAttribute("list", list);
    }

    // 특정 ID를 통해 InterviewBoard 레코드를 조회하는 메서드
    public InterviewBoard get(Long interviewIdx) {
        Optional<InterviewBoard> board = repository.findById(interviewIdx);
        return board.orElse(null);
    }

    // 새로운 InterviewBoard 레코드를 저장하는 메서드
    public void register(InterviewBoard board) {
        repository.save(board);
    }

    // 특정 ID를 통해 InterviewBoard 레코드를 삭제하는 메서드
    public void remove(Long interviewIdx) {
        repository.deleteById(interviewIdx);
    }

    // DB에 맞춰 삭제 및 수정 하는 과정에서 발생한 MyPageController mypage 메소드 오류 때문에 우선 만들어둠 역할 및 사용은 추구 수정 필요
    public Object listAll() {
        return null;
    }

    public Object getAllInterviews() {
        return "";
    }
}