package org.yarusprog.library.facade;

import org.yarusprog.library.dto.UserDto;

public interface UserFacade {
    UserDto findByEmail(String email);
    void saveUser(UserDto user);
    void autoLogin(UserDto user);
}
