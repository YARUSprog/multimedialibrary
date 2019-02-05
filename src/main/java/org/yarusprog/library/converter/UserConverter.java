package org.yarusprog.library.converter;

import java.util.Objects;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.model.UserModel;

@Component
public class UserConverter {

    @Autowired
    private ModelMapper modelMapper;

    public UserModel convertToModel(final UserDto source) {
        if (Objects.nonNull(source)) {
            UserModel user = new UserModel();
            modelMapper.map(source, user);
            return user;
        }
        return null;
    }

    public UserDto convertToDto(final UserModel source) {
        if (Objects.nonNull(source)) {
            UserDto user = new UserDto();
            modelMapper.map(source, user);
            return user;
        }
        return null;
    }
}
