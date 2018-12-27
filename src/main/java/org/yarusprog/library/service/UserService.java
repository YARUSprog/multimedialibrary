package org.yarusprog.library.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.yarusprog.library.model.UserModel;

public interface UserService extends UserDetailsService {
    UserModel findUserByEmail(String email);

    void saveUser(UserModel user);

    String findLoggedInUserEmail();

    void autoLogin(String email, String password);
}