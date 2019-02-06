package org.yarusprog.library.service;

import org.springframework.web.multipart.MultipartFile;
import org.yarusprog.library.model.FileModel;

public interface FileService {
    FileModel save(FileModel file);

    void save(MultipartFile multipartFile);
}
