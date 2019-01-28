package org.yarusprog.library.service;

import org.yarusprog.library.model.ConferenceModel;

import java.util.List;

public interface ConferenceService {
    List<ConferenceModel> findAll();
}
