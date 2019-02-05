package org.yarusprog.library.converter;

import java.util.Collections;
import java.util.Objects;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.yarusprog.library.dto.ArticleDto;
import org.yarusprog.library.dto.CreateArticleDto;
import org.yarusprog.library.model.ArticleModel;
import org.yarusprog.library.service.ConferenceService;
import org.yarusprog.library.service.SubjectService;
import org.yarusprog.library.service.UserService;

@Component
public class ArticleConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private ConferenceService conferenceService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private UserService userService;

    public ArticleModel convertToModel(final CreateArticleDto articleDto) {
        ArticleModel articleModel = new ArticleModel();
        modelMapper.map(articleDto, articleModel);
        articleModel.setConference(conferenceService.findById(articleDto.getConference()));
        articleModel.setSubjects(articleDto.getSubjects().stream().map(id -> subjectService.findById(id)).collect
                (Collectors.toList()));
        articleModel.setUsers(articleDto.getUsers().stream().map(id -> userService.findUserById(id)).collect
                (Collectors.toList()));
        return articleModel;
    }

    public ArticleDto convertToDto(final ArticleModel articleModel) {
        ArticleDto articleDto = new ArticleDto();
        modelMapper.map(articleModel, articleDto);
        articleDto.setConference(
                Objects.nonNull(articleModel.getConference()) ? articleModel.getConference().getName() : StringUtils
                        .EMPTY);
        articleDto.setUsers(
                CollectionUtils.isEmpty(articleModel.getUsers()) ? Collections.EMPTY_LIST
                        : articleModel.getUsers().stream().map(userModel -> userModel.getFirstName()
                        + userModel.getLastName()).collect(Collectors.toList()));
        articleDto.setSubjects(CollectionUtils.isEmpty(articleModel.getSubjects()) ? Collections.EMPTY_LIST
                : articleModel.getSubjects().stream()
                .map(subjectModel -> subjectModel.getName()).collect(Collectors.toList()));
        return articleDto;
    }
}
