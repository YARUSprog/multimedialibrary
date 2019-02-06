package org.yarusprog.library.facade;

import org.springframework.web.multipart.MultipartFile;
import org.yarusprog.library.dto.FileDto;

public interface FileFacade {
    void save(MultipartFile multipartFile);
}
