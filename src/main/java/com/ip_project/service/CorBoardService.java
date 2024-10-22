package com.ip_project.service;

import com.ip_project.entity.CorBoard;
import com.ip_project.repository.CorBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
public class CorBoardService {

    @Autowired
    private CorBoardRepository repository;

    public void list(Model model) {
        List<CorBoard> list = repository.findAll();
        model.addAttribute("list", list);

    }

    public CorBoard get(Long idx) {
        Optional<CorBoard> vo = repository.findById(idx);
        return vo.get();
    }

    public void register(CorBoard vo) {
        repository.save(vo);
    }

    public void remove(Long idx) {
        repository.deleteById(idx);
    }
}
