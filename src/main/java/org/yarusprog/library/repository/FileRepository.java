package org.yarusprog.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.FileModel;
import org.yarusprog.library.model.UserModel;

@Repository("fileRepository")
public interface FileRepository extends JpaRepository<FileModel, String> {
    List<FileModel> findAllByUser(UserModel user);
}
