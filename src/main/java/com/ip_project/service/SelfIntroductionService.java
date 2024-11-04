package com.ip_project.service;

import com.ip_project.dto.SelfIntroductionDTO;
import com.ip_project.entity.SelfBoard;
import com.ip_project.entity.SelfIntroduction;
import com.ip_project.repository.SelfIntroductionRepository;
import com.ip_project.repository.SelfBoardRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SelfIntroductionService {
    private final SelfIntroductionRepository selfIntroductionRepository;
    private final SelfBoardRepository selfBoardRepository;

    public SelfIntroductionDTO getSelfIntroductions(Long selfIdx) {
        // 자기소개서 정보 조회
        SelfBoard selfBoard = (SelfBoard) selfBoardRepository.findBySelfIdx(selfIdx)
                .orElseThrow(() -> new EntityNotFoundException("자기소개서를 찾을 수 없습니다. ID: " + selfIdx));

        List<SelfIntroduction> introductions = selfIntroductionRepository.findAllBySelfIdx(selfIdx);

        // DTO 변환 및 반환
        return convertToDTO(selfBoard, introductions);
    }

    public List<Map<String, Object>> findAllBySelfIdx(Long selfIdx) {
        List<SelfIntroduction> introductions = selfIntroductionRepository.findAllBySelfIdx(selfIdx);
        SelfBoard selfBoard = (SelfBoard) selfBoardRepository.findBySelfIdx(selfIdx)
                .orElseThrow(() -> new EntityNotFoundException("자기소개서를 찾을 수 없습니다. ID: " + selfIdx));

        List<Map<String, Object>> result = new ArrayList<>();
        Map<String, Object> boardInfo = new HashMap<>();
        boardInfo.put("title", selfBoard.getSelfTitle());
        boardInfo.put("company", selfBoard.getSelfCompany());
        boardInfo.put("position", selfBoard.getSelfPosition());
        result.add(boardInfo);

        for (SelfIntroduction intro : introductions) {
            Map<String, Object> introMap = new HashMap<>();
            introMap.put("question", intro.getIntroQuestion());
            introMap.put("answer", intro.getIntroAnswer());
            result.add(introMap);
        }

        return result;
    }

    private SelfIntroductionDTO convertToDTO(SelfBoard selfBoard, List<SelfIntroduction> introductions) {
        SelfIntroductionDTO dto = new SelfIntroductionDTO();

        // 기본 정보 설정
        dto.setTitle(selfBoard.getSelfTitle());
        dto.setCompany(selfBoard.getSelfCompany());
        dto.setPosition(selfBoard.getSelfPosition());

        // 질문과 답변 리스트 설정
        List<String> questions = new ArrayList<>();
        List<String> answers = new ArrayList<>();

        for (SelfIntroduction intro : introductions) {
            questions.add(intro.getIntroQuestion());
            answers.add(intro.getIntroAnswer() != null ? intro.getIntroAnswer() : "");
        }

        dto.setQuestions(questions);
        dto.setAnswers(answers);

        return dto;
    }

    @Transactional
    public void saveSelfIntroduction(SelfIntroduction selfIntroduction) {
        selfIntroductionRepository.save(selfIntroduction);
    }

    @Transactional
    public void deleteSelfIntroduction(SelfIntroduction selfIntroduction) {
        selfIntroductionRepository.delete(selfIntroduction);
    }
}