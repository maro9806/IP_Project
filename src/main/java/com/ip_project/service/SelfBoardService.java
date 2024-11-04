package com.ip_project.service;

import com.ip_project.entity.SelfBoard;
import com.ip_project.repository.SelfBoardRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.time.LocalDateTime;
import java.util.List;


@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SelfBoardService {
    private final SelfBoardRepository selfBoardRepository;

    public void listByUsername(Model model, String username) {
        List<SelfBoard> selfBoards = selfBoardRepository.findByUsername(username);
        model.addAttribute("selfBoards", selfBoards);
    }

    @Transactional
    public SelfBoard save(SelfBoard selfBoard) {
        if (selfBoard.getSelfDate() == null) {
            selfBoard.setSelfDate(LocalDateTime.now());
        }
        return selfBoardRepository.save(selfBoard);
    }
}