package org.yarusprog.library.facade;

import org.yarusprog.library.dto.UserDto;

import java.util.Set;

public interface UserFacade {
    UserDto findByEmail(String email);
    Set<UserDto> findNewUsers();
    void activateUser(long id);
    void registerUser(UserDto user);
    void saveUser(UserDto user);
    void autoLogin(UserDto user);
}
