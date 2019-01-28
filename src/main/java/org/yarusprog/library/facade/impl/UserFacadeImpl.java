package org.yarusprog.library.facade.impl;

import com.google.common.base.Preconditions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
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

    @Override
    public UserDto findByEmail(final String email) {
        Preconditions.checkNotNull(email);
        return convertModelToDto(userService.findUserByEmail(email));
    }

    @Override
    public List<UserNamesAndId> findAllAuthors() {
        return userService.findAllAuthors();
    }

    @Override
    public Set<UserDto> findNewUsers() {
        return userService.findNewUsers().stream().map(userModel -> convertModelToDto(userModel))
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
        userService.registerUser(convertDtoToModel(user));
    }

    @Override
    public void saveUser(final UserDto user) {
        Preconditions.checkNotNull(user);
        userService.saveUser(convertDtoToModel(user));
    }

    @Override
    public void autoLogin(final UserDto user) {
        Preconditions.checkNotNull(user);
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
