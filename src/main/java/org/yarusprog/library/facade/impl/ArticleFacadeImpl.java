package org.yarusprog.library.facade.impl;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;
import org.yarusprog.library.converter.ArticleConverter;
import org.yarusprog.library.dto.ArticleDto;
import org.yarusprog.library.dto.CreateArticleDto;
import org.yarusprog.library.dto.PageArticlesDto;
import org.yarusprog.library.facade.ArticleFacade;
import org.yarusprog.library.model.ArticleModel;
import org.yarusprog.library.service.ArticleService;

@Component("articleFacade")
public class ArticleFacadeImpl implements ArticleFacade {

    private static final Integer PAGE_SIZE = 4;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleConverter articleConverter;

    @Override
    public Long save(final CreateArticleDto article) {
        ArticleModel articleModel = articleService.save(articleConverter.convertToModel(article));
        if (Objects.nonNull(articleModel)) {
            return articleModel.getId();
        }
        return null;
    }

    @Override
    public List<ArticleDto> findAll() {
        return articleService.findAll().stream().map(articleConverter::convertToDto).collect(Collectors.toList());
    }

    @Override
    public ArticleDto findById(final long id) {
        return articleConverter.convertToDto(articleService.findById(id));
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
        List<ArticleDto> content = articleModels.getContent().stream().map(articleConverter::convertToDto)
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
}
