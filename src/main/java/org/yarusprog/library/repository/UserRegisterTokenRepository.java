package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.UserRegisterTokenModel;

@Repository("userRegisterTokenRepository")
public interface UserRegisterTokenRepository extends JpaRepository<UserRegisterTokenModel, Long> {
}
