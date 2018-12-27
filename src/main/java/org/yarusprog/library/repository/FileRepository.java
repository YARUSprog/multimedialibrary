package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.FileModel;

@Repository("fileRepository")
public interface FileRepository extends JpaRepository<FileModel, String> {
}
