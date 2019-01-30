package org.yarusprog.library.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.yarusprog.library.dto.ArticleDto;
import org.yarusprog.library.dto.PageArticlesDto;
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

    private static final Integer PAGE_SIZE = 4;

    @Autowired
    private ArticleService articleService;

    @Override
    public List<ArticleDto> findAll() {
        return articleService.findAll().stream().map(this::convertModelToDto).collect(Collectors.toList());
    }

    @Override
    public ArticleDto findById(final long id) {
        return convertModelToDto(articleService.findById(id));
    }

    @Override
    public List<Date> findAllDates() {
        return articleService.findAllDates();
    }

    @Override
    public PageArticlesDto findFilteredArticles(final String searchText, final Integer searchAuthor,
                                                 final Integer searchConf, final Integer searchSubject,
                                                 final Integer searchYear, final Integer pageNumber) {

        Page<ArticleModel> articleModels = articleService.findFilteringArticle(searchText, searchAuthor, searchConf,
                searchSubject, searchYear, pageNumber, PAGE_SIZE);
        List<ArticleDto> content = articleModels.getContent().stream().map(this::convertModelToDto)
                .collect(Collectors.toList());
        return new PageArticlesDto(content, articleModels.getTotalPages(), articleModels.getNumber());
    }

    @Override
    public int getStartGroupPagination(Integer groupId, int countGroup) {
        return articleService.getStartGroupPagination(groupId, countGroup);
    }

    @Override
    public int getEndGroupPagination(Integer groupId, int countGroup) {
        return articleService.getEndGroupPagination(groupId, countGroup);
    }

    @Override
    public int validateGroupId(Integer groupId, int countGroup) {
        return articleService.validateGroupId(groupId, countGroup);
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
