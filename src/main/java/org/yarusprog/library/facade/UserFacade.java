package org.yarusprog.library.facade;

import org.yarusprog.library.dto.UserDto;

public interface UserFacade {
    void saveUser(UserDto user);
    void autoLogin(UserDto user);
}
