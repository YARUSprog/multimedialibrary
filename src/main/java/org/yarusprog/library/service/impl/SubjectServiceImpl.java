package org.yarusprog.library.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yarusprog.library.model.SubjectModel;
import org.yarusprog.library.repository.SubjectRepository;
import org.yarusprog.library.service.SubjectService;

import java.util.List;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public List<SubjectModel> findAll() {
        return subjectRepository.findAllByOrderByNameAsc();
    }
}
