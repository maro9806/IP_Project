package com.ip_project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ip_project.entity.Board;
import com.ip_project.repository.BoardRepository;

@Service
public class BoardService {

    @Autowired
    private BoardRepository repository;

    public void list(Model model) {
        List<Board> list = repository.findAll();
        model.addAttribute("list", list);

    }

    public Board get(Long idx) {
        Optional<Board> vo = repository.findById(idx);
        return vo.get();
    }

    public void register(Board vo) {
        repository.save(vo);
    }

    public void remove(Long idx) {
        repository.deleteById(idx);
    }

}