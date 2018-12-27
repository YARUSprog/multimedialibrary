package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.PersistentLoginsModel;

@Repository("persistentLoginsRepository")
public interface PersistentLoginsRepository extends JpaRepository<PersistentLoginsModel, String> {
}
