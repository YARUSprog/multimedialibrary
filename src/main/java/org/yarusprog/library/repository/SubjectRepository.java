package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.SubjectModel;

@Repository("subjectRepository")
public interface SubjectRepository extends JpaRepository<SubjectModel, Long> {
}
