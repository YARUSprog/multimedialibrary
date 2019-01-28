package org.yarusprog.library.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.yarusprog.library.vo.UserNamesAndId;
import org.yarusprog.library.model.UserModel;

import java.util.List;
import java.util.Set;

public interface UserService extends UserDetailsService {

    UserModel findUserByEmail(String email);

    UserModel findUserById(long id);

    List<UserNamesAndId> findAllAuthors();

    Set<UserModel> findNewUsers();

    void registerUser(UserModel user);

    void saveUser(UserModel user);

    String findLoggedInUserEmail();

    void autoLogin(String email, String password);
}