package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.UserRoleModel;

@Repository("userRoleRepository")
public interface UserRoleRepository extends JpaRepository<UserRoleModel, Integer> {
    UserRoleModel findByName(String Name);
}