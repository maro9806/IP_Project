package com.ip_project.service;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
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
}