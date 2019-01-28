package org.yarusprog.library.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yarusprog.library.facade.ConferenceFacade;
import org.yarusprog.library.model.ConferenceModel;
import org.yarusprog.library.service.ConferenceService;

import java.util.List;

@Component
public class ConferenceFacadeImpl implements ConferenceFacade {

    @Autowired
    private ConferenceService conferenceService;

    @Override
    public List<ConferenceModel> findAll() {
        return conferenceService.findAll();
    }
}
