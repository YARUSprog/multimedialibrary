package org.yarusprog.library.facade;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.yarusprog.library.dto.FileDto;
import org.yarusprog.library.model.FileModel;

public interface FileFacade {
    void save(MultipartFile multipartFile);

    List<FileDto> getAllSessionUserFiles();
}
