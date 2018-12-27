package org.yarusprog.library.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.facade.UserFacade;
import org.yarusprog.library.model.UserModel;
import org.yarusprog.library.service.UserService;

@Component
public class UserFacadeImpl implements UserFacade {

    @Autowired
    private UserService userService;

    @Override
    public void saveUser(final UserDto user) {
        userService.saveUser(convertDtoToModel(user));
    }

    @Override
    public void autoLogin(final UserDto user) {
        userService.autoLogin(user.getEmail(), user.getPassword());
    }


    private UserModel convertDtoToModel(final UserDto userDto){
        UserModel user = new UserModel();
        user.setId(userDto.getId());
        user.setEmail(userDto.getEmail());
        user.setFirstName(userDto.getFirstName());
        user.setMiddleName(userDto.getMiddleName());
        user.setLastName(userDto.getLastName());
        user.setPassword(userDto.getPassword());
        user.setAccountNonLocked(userDto.isAccountNonLocked());
        user.setEnable(userDto.isEnable());
        user.setTeacher(userDto.isTeacher());
        return user;
    }
}
