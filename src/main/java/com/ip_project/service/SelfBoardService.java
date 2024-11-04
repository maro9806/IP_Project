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

    public SelfBoard findBySelfIdx(Long selfIdx) {
        String sql = "SELECT * FROM self_board WHERE self_idx = ?";
        return jdbcTemplate.queryForObject(sql, (rs, rowNum) ->
                        SelfBoard.builder()
                                .selfIdx(rs.getLong("self_idx"))
                                .selfTitle(rs.getString("self_title"))
                                .selfCompany(rs.getString("self_company"))
                                .selfPosition(rs.getString("self_position"))
                                .build()
                , selfIdx);
    }

}