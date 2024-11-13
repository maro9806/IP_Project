package com.ip_project.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;

@Configuration
public class GoogleCloudConfig {

    @Value("${gcp.project.id}")
    private String projectId;

    @Value("${gcp.credentials.location}")
    private String credentialsPath;  // 추가

    @Bean
    public Storage googleCloudStorage() throws IOException {
        // credentialsPath 설정 사용
        GoogleCredentials credentials = GoogleCredentials.fromStream(
                new ClassPathResource(credentialsPath.replace("classpath:", "")).getInputStream()
        );

        return StorageOptions.newBuilder()
                .setProjectId(projectId)
                .setCredentials(credentials)
                .build()
                .getService();
    }
}