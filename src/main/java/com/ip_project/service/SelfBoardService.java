package com.ip_project.service;

import com.ip_project.entity.SelfBoard;
import com.ip_project.repository.SelfBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
public class SelfBoardService {
    @Autowired
    private SelfBoardRepository selfBoardRepository;

    public void listByUsername(Model model, String username) {
        List<SelfBoard> selfBoards = selfBoardRepository.findByMemberUsername(username);
        // 내림차순으로 정렬
        selfBoards.sort((o1, o2) -> o2.getSelfDate().compareTo(o1.getSelfDate()));
        model.addAttribute("selfBoards", selfBoards);
    }

    public void list(Model model) {
        List<SelfBoard> selfBoards = selfBoardRepository.findAll();
        model.addAttribute("selfBoards", selfBoards);
    }

    public SelfBoard findById(Long idx) {
        Optional<SelfBoard> selfBoard = selfBoardRepository.findById(idx);
        return selfBoard.orElse(null); // SelfBoard가 존재하지 않을 경우 null 반환
    }

    public void save(SelfBoard selfBoard) {
        selfBoardRepository.save(selfBoard);
    }


}
