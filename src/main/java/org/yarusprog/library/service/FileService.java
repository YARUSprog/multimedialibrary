package org.yarusprog.library.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.yarusprog.library.dto.FileDto;
import org.yarusprog.library.model.FileModel;

public interface FileService {
    FileModel save(FileModel file);

    void save(MultipartFile multipartFile);

    List<FileModel> getAllSessionUserFiles();
}
