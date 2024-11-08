package com.ip_project.service;

import java.util.List;
import java.util.Optional;

import com.ip_project.dto.ReviewDTO;
import com.ip_project.entity.IntroQuestion;
import com.ip_project.repository.IntroQuestionRepository;
import com.ip_project.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.ip_project.entity.Review;
import com.ip_project.repository.ReviewRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Service
@RequiredArgsConstructor
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;
    private final IntroQuestionRepository introQuestionRepository;
    private final MemberRepository memberRepository;

    @Transactional
    public void saveReview(ReviewDTO reviewDTO, String username) {
        Review review = new Review();
        review.setReviewTitle(reviewDTO.getReviewTitle());
        review.setReviewCompany(reviewDTO.getReviewCompany());
        review.setReviewPosition(reviewDTO.getReviewPosition());
        review.setPeriod(reviewDTO.getPeriod());
        review.setResult(reviewDTO.getResult());
        review.setCount(0L);
        review.setMember(memberRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found")));

        // 자유형식 처리
        review.setAtmosphere(reviewDTO.getAtmosphere());
        review.setSorrow(reviewDTO.getSorrow());
        review.setAdvice(reviewDTO.getAdvice());

        String content = String.format(
                "면접 분위기: %s\n아쉬웠던 점: %s\n조언: %s",
                review.getAtmosphere(),
                review.getSorrow(), review.getAdvice()
        );
        review.setReviewContent(content);
        StringBuilder contentBuilder = new StringBuilder();


        for (ReviewDTO.IntroQuestionDTO questionDTO : reviewDTO.getQuestions()) {
            IntroQuestion question = new IntroQuestion();
            question.setIntroQuestion(questionDTO.getQuestion());
            question.setIntroAnswer(questionDTO.getAnswer());
            question.setReview(review);
            review.getQuestions().add(question);

            contentBuilder.append("질문: ").append(questionDTO.getQuestion())
                    .append("\n답변: ").append(questionDTO.getAnswer())
                    .append("\n\n");
        }

        reviewRepository.save(review);
    }


    public void list(Model model) {
        List<Review> list = reviewRepository.findAll();
        model.addAttribute("list", list);
    }

    public List<Review> getReviews(String orderBy, String keyword) {
        if (orderBy.equals("all")) {
            return reviewRepository.findAllByKeyword(keyword);
        } else {
            return reviewRepository.findByReviewResultAndKeyword(orderBy, keyword);
        }
    }

    //사용자 개인 면접 후기
    public void listByUsername(Model model, String username) {
        List<Review> reviews = reviewRepository.findByMemberUsername(username);
        model.addAttribute("reviews", reviews);
    }

    public void findById(Long idx, Model model) {
        Review dto = reviewRepository.findById(idx)
                .orElseThrow(() -> new RuntimeException("Review not found")); // 없으면 예외 처리
        model.addAttribute("reviewDto", dto); // Optional을 벗겨내고 Review 객체만 추가
    }

    public Review get(Long idx) {
        return reviewRepository.findById(idx)
                .orElseThrow(() -> new RuntimeException("Review not found with id: " + idx));
    }

    public void register(Review vo) {
        reviewRepository.save(vo);
    }

    public void remove(Long idx) {
        reviewRepository.deleteById(idx);
    }

    public int getTotalCount() {
        return (int) reviewRepository.count();  // long을 int로 캐스팅
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

        return reviewRepository.findByPage(startRow, endRow);
    }









}
