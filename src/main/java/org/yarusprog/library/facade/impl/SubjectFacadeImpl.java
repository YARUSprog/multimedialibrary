package org.yarusprog.library.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yarusprog.library.facade.SubjectFacade;
import org.yarusprog.library.model.SubjectModel;
import org.yarusprog.library.service.SubjectService;

import java.util.List;

@Component
public class SubjectFacadeImpl implements SubjectFacade {

    @Autowired
    private SubjectService subjectService;

    @Override
    public List<SubjectModel> findAll() {
        return subjectService.findAll();
    }
}
