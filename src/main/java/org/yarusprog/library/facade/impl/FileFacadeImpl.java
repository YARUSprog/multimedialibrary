package org.yarusprog.library.facade.impl;

import com.google.common.base.Preconditions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.yarusprog.library.converter.FileConverter;
import org.yarusprog.library.dto.FileDto;
import org.yarusprog.library.facade.FileFacade;
import org.yarusprog.library.service.FileService;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Component
public class FileFacadeImpl implements FileFacade {

    @Autowired
    private FileService fileService;

    @Autowired
    private FileConverter fileConverter;

    @Override
    public void save(final MultipartFile multipartFile) {
        Preconditions.checkArgument(Objects.nonNull(multipartFile), "MultipartFile can't be null");
        fileService.save(multipartFile);
    }

    @Override
    public List<FileDto> getAllSessionUserFiles() {
        return fileService.getAllSessionUserFiles().stream().map(fileConverter::convertToDto).collect(Collectors
                .toList());
    }
}
