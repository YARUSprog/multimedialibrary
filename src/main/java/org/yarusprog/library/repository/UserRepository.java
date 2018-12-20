package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.User;

@Repository("userRepository")
public interface  UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
