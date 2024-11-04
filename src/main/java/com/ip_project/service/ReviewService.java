package com.ip_project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.ip_project.entity.Review;
import com.ip_project.repository.ReviewRepository;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository repository;

    public List<Review> list() {
        return repository.findAll();
    }

    public Review get(Long idx) {
        return repository.findById(idx)
                .orElseThrow(() -> new RuntimeException("Review not found with id: " + idx));
    }

    public void register(Review vo) {
        repository.save(vo);
    }

    public void remove(Long idx) {
        repository.deleteById(idx);
    }

    public int getTotalCount() {
        return (int) repository.count();  // long을 int로 캐스팅
    }

    public List<Review> getListByPage(int page, int pageSize) {
        // Oracle 페이징 처리를 위한 ROWNUM 사용
        String sql = """
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum FROM (
                    SELECT * FROM review_board ORDER BY idx DESC
                ) a WHERE ROWNUM <= ?
            ) WHERE rnum > ?
        """;

        int endRow = page * pageSize;
        int startRow = (page - 1) * pageSize;

        return repository.findByPage(startRow, endRow);
    }
}