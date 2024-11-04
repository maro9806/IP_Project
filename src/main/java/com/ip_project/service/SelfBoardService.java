package com.ip_project.service;

import com.ip_project.entity.SelfBoard;
import com.ip_project.repository.SelfBoardRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
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
    private final JdbcTemplate jdbcTemplate;

    public void listByUsername(Model model, String username) {
        // findByMemberUsername를 findByUsername으로 변경
        List<SelfBoard> selfBoards = selfBoardRepository.findByUsername(username);
        // 내림차순으로 정렬
        selfBoards.sort((o1, o2) -> o2.getSelfDate().compareTo(o1.getSelfDate()));
        model.addAttribute("selfBoards", selfBoards);
    }

    @Transactional
    public SelfBoard save(SelfBoard selfBoard) {
        if (selfBoard.getSelfDate() == null) {
            selfBoard.setSelfDate(LocalDateTime.now());
        }
        return selfBoardRepository.save(selfBoard);
    }

    public SelfBoard findBySelfIdx(Long selfIdx) {
        // JdbcTemplate 대신 Repository 사용
        return selfBoardRepository.findBySelfIdx(selfIdx)
                .orElseThrow(() -> new EntityNotFoundException("해당 자기소개서를 찾을 수 없습니다. ID: " + selfIdx));
    }
}