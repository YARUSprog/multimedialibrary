package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.ConferenceModel;

import java.util.List;

@Repository("conferenceRepository")
public interface ConferenceRepository extends JpaRepository<ConferenceModel, Long> {
    List<ConferenceModel> findAllByOrderByNameAsc();
}
