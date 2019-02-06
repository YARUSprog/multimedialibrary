package org.yarusprog.library.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yarusprog.library.dto.FileDto;
import org.yarusprog.library.model.FileModel;
import org.yarusprog.library.service.UserService;

@Component
public class FileConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private UserService userService;

    public FileModel convertToModel(final FileDto source) {
        FileModel fileModel = new FileModel();
        modelMapper.map(source, fileModel);
        fileModel.setUser(userService.findUserById(source.getUser()));
        return fileModel;
    }

    public FileDto convertToDto(final FileModel source) {
        FileDto fileDto = new FileDto();
        modelMapper.map(source, fileDto);
        fileDto.setUser(source.getUser().getId());
        return fileDto;
    }
}
