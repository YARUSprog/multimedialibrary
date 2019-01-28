package org.yarusprog.library.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.yarusprog.library.model.ConferenceModel;
import org.yarusprog.library.repository.ConferenceRepository;
import org.yarusprog.library.service.ConferenceService;

import java.util.List;

@Service
public class ConferenceServiceImpl implements ConferenceService {

    @Autowired
    private ConferenceRepository conferenceRepository;

    @Override
    public List<ConferenceModel> findAll() {
        return conferenceRepository.findAllByOrderByNameAsc();
    }
}
