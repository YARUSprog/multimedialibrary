package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.UserModel;

import java.util.Set;

@Repository("userRepository")
public interface  UserRepository extends JpaRepository<UserModel, Long> {
    UserModel findByEmail(String email);
    Set<UserModel> findAllByEnableIsFalse();
}
