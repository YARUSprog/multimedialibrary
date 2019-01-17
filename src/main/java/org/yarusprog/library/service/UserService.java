package org.yarusprog.library.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.yarusprog.library.model.UserModel;

import java.util.Set;

public interface UserService extends UserDetailsService {

    UserModel findUserByEmail(String email);

    UserModel findUserById(long id);

    Set<UserModel> findNewUsers();

    void registerUser(UserModel user);

    void saveUser(UserModel user);

    String findLoggedInUserEmail();

    void autoLogin(String email, String password);
}