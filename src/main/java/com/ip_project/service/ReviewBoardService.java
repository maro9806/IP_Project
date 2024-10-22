package com.ip_project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ip_project.entity.ReviewBoard;
import com.ip_project.repository.ReviewBoardRepository;

@Service
public class ReviewBoardService {

    @Autowired
    private ReviewBoardRepository repository;

    public void list(Model model) {
        List<ReviewBoard> list = repository.findAll();
        model.addAttribute("list", list);

    }

    public ReviewBoard get(Long idx) {
        Optional<ReviewBoard> vo = repository.findById(idx);
        return vo.get();
    }

    public void register(ReviewBoard vo) {
        repository.save(vo);
    }

    public void remove(Long idx) {
        repository.deleteById(idx);
    }

}