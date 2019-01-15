package org.yarusprog.library.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.facade.UserFacade;
import org.yarusprog.library.model.UserModel;
import org.yarusprog.library.service.UserService;

import java.util.Objects;

@Component
public class UserFacadeImpl implements UserFacade {

    @Autowired
    private UserService userService;

    public UserDto findByEmail(final String email) {
        return convertModelToDto(userService.findUserByEmail(email));
    }

    @Override
    public void saveUser(final UserDto user) {
        userService.saveUser(convertDtoToModel(user));
    }

    @Override
    public void autoLogin(final UserDto user) {
        userService.autoLogin(user.getEmail(), user.getPassword());
    }


    private UserModel convertDtoToModel(final UserDto source) {
        if (Objects.nonNull(source)) {
            UserModel user = new UserModel();
            user.setId(source.getId());
            user.setEmail(source.getEmail());
            user.setPassword(source.getPassword());
            user.setFirstName(source.getFirstName());
            user.setMiddleName(source.getMiddleName());
            user.setLastName(source.getLastName());
            user.setDetails(source.getDetails());
            user.setTeacher(source.isTeacher());
            return user;
        }
        return null;
    }

    private UserDto convertModelToDto(final UserModel source) {
        if (Objects.nonNull(source)) {
            UserDto user = new UserDto();
            user.setId(source.getId());
            user.setEmail(source.getEmail());
            user.setPassword(source.getPassword());
            user.setFirstName(source.getFirstName());
            user.setMiddleName(source.getMiddleName());
            user.setLastName(source.getLastName());
            user.setDetails(source.getDetails());
            user.setTeacher(source.isTeacher());
            return user;
        }
        return null;
    }
}
