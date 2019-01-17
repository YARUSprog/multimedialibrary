package org.yarusprog.library.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yarusprog.library.model.UserModel;
import org.yarusprog.library.model.UserRoleModel;
import org.yarusprog.library.repository.UserRepository;
import org.yarusprog.library.repository.UserRoleRepository;
import org.yarusprog.library.service.UserService;

import java.util.Arrays;
import java.util.Set;

@Service("userService")
public class UserServiceImpl implements UserService {

    private static String ROLE_AUTHOR = "AUTHOR";

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserRoleRepository userRoleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private AuthenticationManager authenticationManager;

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Override
    public UserModel findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public UserModel findUserById(final long id) {
        return userRepository.findOne(id);
    }

    @Override
    public Set<UserModel> findNewUsers() {
        return userRepository.findAllByEnableIsFalse();
    }

    @Override
    public void registerUser(UserModel user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setEnable(false);
        UserRoleModel userRole = userRoleRepository.findByName(ROLE_AUTHOR);
        user.setUserRole(userRole);
        saveUser(user);
    }

    @Override
    public void saveUser(UserModel user) {
        userRepository.save(user);
    }

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        UserModel user = userRepository.findByEmail(email);
        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), user
                .isEnable(), true, true, user.isAccountNonLocked(),
                Arrays.asList(new SimpleGrantedAuthority(user.getUserRole().getName())));
    }

    @Override
    public String findLoggedInUserEmail() {
        Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (userDetails instanceof UserDetails) {
            return ((UserDetails)userDetails).getUsername();
        }

        return null;
    }

    @Override
    public void autoLogin(String email, String password) {
        UserDetails userDetails = loadUserByUsername(email);
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());

        authenticationManager.authenticate(usernamePasswordAuthenticationToken);

        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            logger.debug(String.format("Auto login %s successfully!", email));
        }
    }
}