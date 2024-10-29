package com.ip_project.service;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import com.ip_project.entity.ReviewBoard;
import com.ip_project.repository.ReviewBoardRepository;

@Service
public class ReviewBoardService {

    @Autowired
    private ReviewBoardRepository repository;

    public List<ReviewBoard> list() {
        return repository.findAll();
    }

    public ReviewBoard get(Long idx) {
        return repository.findById(idx)
                .orElseThrow(() -> new RuntimeException("Review not found with id: " + idx));
    }

    public void register(ReviewBoard vo) {
        repository.save(vo);
    }

    public void remove(Long idx) {
        repository.deleteById(idx);
    }

    public int getTotalCount() {
        return (int) repository.count();  // long을 int로 캐스팅
    }

    public List<ReviewBoard> getListByPage(int page, int pageSize) {
        // 최신글이 먼저 오도록 정렬 추가
        PageRequest pageRequest = PageRequest.of(page - 1, pageSize, Sort.by("idx").descending());
        Page<ReviewBoard> result = repository.findAll(pageRequest);
        return result.getContent();
    }
}