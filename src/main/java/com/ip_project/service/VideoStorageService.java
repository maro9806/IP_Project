package com.ip_project.service;

import com.google.cloud.storage.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class VideoStorageService {

    private final Storage storage;

    @Value("${gcp.bucket.name}")
    private String bucketName;

    public String storeVideo(MultipartFile file, Long interviewId, Integer questionNumber) {
        try {
            // 파일명 생성 (interview_id/question_number/timestamp_uuid.webm)
            String timestamp = String.valueOf(System.currentTimeMillis());
            String uuid = UUID.randomUUID().toString();
            String fileName = String.format("interviews/%d/question_%d/%s_%s.webm",
                    interviewId, questionNumber, timestamp, uuid);

            // 파일 메타데이터 설정
            BlobId blobId = BlobId.of(bucketName, fileName);
            BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                    .setContentType(file.getContentType())
                    .build();

            // 파일 업로드
            storage.create(blobInfo, file.getBytes());

            // 공개 URL 생성
            return String.format("https://storage.googleapis.com/%s/%s", bucketName, fileName);

        } catch (IOException e) {
            log.error("Failed to upload video file", e);
            throw new RuntimeException("Could not store video file", e);
        }
    }

    public void deleteVideo(String fileName) {
        try {
            BlobId blobId = BlobId.of(bucketName, fileName);
            boolean deleted = storage.delete(blobId);
            if (!deleted) {
                log.warn("File {} was not found in bucket {}", fileName, bucketName);
            }
        } catch (Exception e) {
            log.error("Failed to delete video file", e);
            throw new RuntimeException("Could not delete video file", e);
        }
    }
}