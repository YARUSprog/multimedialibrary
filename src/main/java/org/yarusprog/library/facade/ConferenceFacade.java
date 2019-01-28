package org.yarusprog.library.facade;

import org.yarusprog.library.model.ConferenceModel;

import java.util.List;

public interface ConferenceFacade {
    List<ConferenceModel> findAll();
}
