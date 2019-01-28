package org.yarusprog.library.facade;

import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.vo.UserNamesAndId;

import java.util.List;
import java.util.Set;

public interface UserFacade {
    UserDto findByEmail(String email);

    List<UserNamesAndId> findAllAuthors();

    Set<UserDto> findNewUsers();

    void activateUser(long id);

    void registerUser(UserDto user);

    void saveUser(UserDto user);

    void autoLogin(UserDto user);
}
