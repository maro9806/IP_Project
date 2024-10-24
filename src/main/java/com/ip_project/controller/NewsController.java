package com.ip_project.controller;

import com.ip_project.config.NewsApiConfig;
import com.ip_project.dto.NewsApiResponse;
import com.ip_project.dto.NewsArticle;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class NewsController {

    private final NewsApiConfig newsApiConfig;

    @GetMapping("/news")
    public ResponseEntity<List<NewsArticle>> getNews(@RequestParam String corpName) {
        try {
            String url = String.format("https://newsapi.org/v2/everything?q=%s&language=ko&pageSize=10&apiKey=%s",
                    corpName, newsApiConfig.getKey());

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<NewsApiResponse> response = restTemplate.getForEntity(url, NewsApiResponse.class);

            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                return ResponseEntity.ok(response.getBody().getArticles());
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}