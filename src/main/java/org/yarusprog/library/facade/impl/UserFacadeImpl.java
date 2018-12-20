package org.yarusprog.library.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.facade.UserFacade;
import org.yarusprog.library.model.User;
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


    private User convertDtoToModel(final UserDto userDto){
        User user = new User();
        user.setId(userDto.getId());
        user.setEmail(userDto.getEmail());
        user.setName(userDto.getName());
        user.setLastName(userDto.getLastName());
        user.setPassword(userDto.getPassword());
        return user;
    }
}
