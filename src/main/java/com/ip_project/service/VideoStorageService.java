package com.ip_project.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.util.StringUtils;
import lombok.RequiredArgsConstructor;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class VideoStorageService {
    private final String storageLocation = "videos/";

    public String store(MultipartFile file) {
        try {
            String filename = StringUtils.cleanPath(file.getOriginalFilename());
            String uniqueFilename = UUID.randomUUID().toString() + "_" + filename;
            Path targetLocation = Path.of(storageLocation).resolve(uniqueFilename);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
            return uniqueFilename;
        } catch (IOException e) {
            throw new StorageException("Failed to store video file", e);
        }
    }

    public class StorageException extends RuntimeException {
        public StorageException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}