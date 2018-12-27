package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.UserAttemptsModel;

@Repository("userAttemptsRepository")
public interface UserAttemptsRepository extends JpaRepository<UserAttemptsModel, Long> {
}
