package com.ip_project.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NewsArticle {
    private String title;
    private String description;
    private String url;
    private String urlToImage;
    private String publishedAt;
}