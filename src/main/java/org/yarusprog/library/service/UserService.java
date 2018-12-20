package org.yarusprog.library.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.yarusprog.library.model.User;

public interface UserService extends UserDetailsService {
    User findUserByEmail(String email);

    void saveUser(User user);

    String findLoggedInUserEmail();

    void autoLogin(String email, String password);
}