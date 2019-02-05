package org.yarusprog.library.facade.impl;

import com.google.common.base.Preconditions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yarusprog.library.converter.UserConverter;
import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.facade.UserFacade;
import org.yarusprog.library.model.UserModel;
import org.yarusprog.library.vo.UserNamesAndId;
import org.yarusprog.library.service.UserService;

import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Component
public class UserFacadeImpl implements UserFacade {

    @Autowired
    private UserService userService;

    @Autowired
    private UserConverter userConverter;

    @Override
    public UserDto findByEmail(final String email) {
        Preconditions.checkNotNull(email);
        return userConverter.convertToDto(userService.findUserByEmail(email));
    }

    @Override
    public List<UserNamesAndId> findAllAuthors() {
        return userService.findAllAuthors();
    }

    @Override
    public Set<UserDto> findNewUsers() {
        return userService.findNewUsers().stream().map(userModel -> userConverter.convertToDto(userModel))
                .collect(Collectors.toSet());
    }

    @Override
    public void activateUser(long id) {
        UserModel user = userService.findUserById(id);
        if (Objects.nonNull(user)) {
            user.setEnable(true);
            userService.saveUser(user);
        }
    }

    @Override
    public void registerUser(final UserDto user) {
        Preconditions.checkNotNull(user);
        userService.registerUser(userConverter.convertToModel(user));
    }

    @Override
    public void saveUser(final UserDto user) {
        Preconditions.checkNotNull(user);
        userService.saveUser(userConverter.convertToModel(user));
    }

    @Override
    public void autoLogin(final UserDto user) {
        Preconditions.checkNotNull(user);
        userService.autoLogin(user.getEmail(), user.getPassword());
    }
}
