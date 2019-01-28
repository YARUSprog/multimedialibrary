package org.yarusprog.library.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.yarusprog.library.dto.ArticleDto;
import org.yarusprog.library.facade.ArticleFacade;
import org.yarusprog.library.model.ArticleModel;
import org.yarusprog.library.service.ArticleService;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Component("articleFacade")
public class ArticleFacadeImpl implements ArticleFacade {

    @Autowired
    private ArticleService articleService;

    @Override
    public List<ArticleDto> findAll() {
        return articleService.findAll().stream().map(this::convertModelToDto).collect(Collectors.toList());
    }

    @Override
    public List<Date> findAllDates() {
        return articleService.findAllDates();
    }

    @Override
    public List<ArticleDto> findFilteredArticles(final String searchText, final Integer searchAuthor, final Integer searchConf,
                                                 final Integer searchSubject, final Integer searchYear) {
        return articleService.findFilteringArticle(searchText, searchAuthor, searchConf, searchSubject, searchYear).stream()
                .map(this::convertModelToDto).collect(Collectors.toList());
    }

    private ArticleDto convertModelToDto(final ArticleModel articleModel) {
        ArticleDto articleDto = new ArticleDto();
        articleDto.setId(articleModel.getId());
        articleDto.setText(articleModel.getText());
        articleDto.setTitle(articleModel.getTitle());
        articleDto.setUpdateDate(articleModel.getUpdateDate());
        articleDto.setConference(
                Objects.nonNull(articleModel.getConference()) ? articleModel.getConference().getName() : "");
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
