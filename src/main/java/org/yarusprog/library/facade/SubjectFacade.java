package org.yarusprog.library.facade;

import org.yarusprog.library.model.SubjectModel;

import java.util.List;

public interface SubjectFacade {
    List<SubjectModel> findAll();
}
