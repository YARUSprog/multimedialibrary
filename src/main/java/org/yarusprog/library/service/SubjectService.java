package org.yarusprog.library.service;

import org.yarusprog.library.model.SubjectModel;

import java.util.List;

public interface SubjectService {
    List<SubjectModel> findAll();

    SubjectModel findById(Long id);
}
