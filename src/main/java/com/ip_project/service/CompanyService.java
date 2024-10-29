package com.ip_project.service;

import com.ip_project.entity.Company;
import com.ip_project.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
public class CompanyService {

    @Autowired
    private CompanyRepository repository;

    public void list(Model model) {
        List<Company> list = repository.findAll();
        model.addAttribute("list", list);
    }

    public Company get(Long companyIdx) {  // 변경 전: companyId
        Optional<Company> company = repository.findById(companyIdx);  // 변경 전: companyId
        return company.orElse(null);
    }

    public void register(Company company) {
        repository.save(repository.save(company));
    }

    public void remove(Long companyIdx) {  // 변경 전: companyId
        repository.deleteById(companyIdx);  // 변경 전: companyId
    }
}
