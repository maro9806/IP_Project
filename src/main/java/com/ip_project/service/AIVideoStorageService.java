package com.ip_project.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Slf4j
@Service
public class AIVideoStorageService {

    @Value("${file.upload.directory}")
    private String uploadDir;

    @Value("${file.upload.max-size:524288000}") // 기본값 500MB
    private long maxFileSize;

    /**
     * 비디오 파일을 저장하고 파일 경로를 반환합니다.
     */
    public String store(MultipartFile file) {
        validateFile(file);

        try {
            String filename = generateFileName(file);
            Path uploadPath = createUploadPath();
            Path filePath = uploadPath.resolve(filename);

            // 파일 저장
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            log.info("Video file saved successfully: {}", filename);
            return filename;

        } catch (IOException e) {
            log.error("Failed to store video file", e);
            throw new AIVideoStorageException("비디오 파일 저장에 실패했습니다.", e);
        }
    }

    /**
     * 저장된 비디오 파일을 삭제합니다.
     */
    public void deleteVideo(String filename) {
        try {
            Path filePath = Paths.get(uploadDir).resolve(filename);
            Files.deleteIfExists(filePath);
            log.info("Video file deleted successfully: {}", filename);
        } catch (IOException e) {
            log.error("Failed to delete video file: {}", filename, e);
            throw new AIVideoStorageException("비디오 파일 삭제에 실패했습니다.", e);
        }
    }

    /**
     * 저장된 비디오 파일의 전체 경로를 반환합니다.
     */
    public Path getVideoPath(String filename) {
        return Paths.get(uploadDir).resolve(filename);
    }

    private void validateFile(MultipartFile file) {
        if (file.isEmpty()) {
            throw new AIVideoStorageException("빈 파일은 업로드할 수 없습니다.");
        }

        if (file.getSize() > maxFileSize) {
            throw new AIVideoStorageException("파일 크기가 제한을 초과했습니다. (최대 500MB)");
        }

        String contentType = file.getContentType();
        if (contentType == null || !contentType.startsWith("video/")) {
            throw new AIVideoStorageException("비디오 파일만 업로드할 수 있습니다.");
        }
    }

    private String generateFileName(MultipartFile file) {
        String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        String randomUUID = UUID.randomUUID().toString().substring(0, 8);

        String extension = "";
        int dotIndex = originalFilename.lastIndexOf('.');
        if (dotIndex > 0) {
            extension = originalFilename.substring(dotIndex);
        }

        return timestamp + "_" + randomUUID + extension;
    }

    private Path createUploadPath() throws IOException {
        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        return uploadPath;
    }
}

// Custom exception for video storage related errors
class AIVideoStorageException extends RuntimeException {
    public AIVideoStorageException(String message) {
        super(message);
    }

    public AIVideoStorageException(String message, Throwable cause) {
        super(message, cause);
    }
}