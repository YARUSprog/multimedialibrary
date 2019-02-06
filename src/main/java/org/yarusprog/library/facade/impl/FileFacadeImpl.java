package org.yarusprog.library.facade.impl;

import com.google.common.base.Preconditions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.yarusprog.library.facade.FileFacade;
import org.yarusprog.library.service.FileService;

import java.util.Objects;

@Component
public class FileFacadeImpl implements FileFacade {

    @Autowired
    private FileService fileService;

    @Override
    public void save(final MultipartFile multipartFile) {
        Preconditions.checkArgument(Objects.nonNull(multipartFile), "MultipartFile can't be null");
        fileService.save(multipartFile);
    }
}
