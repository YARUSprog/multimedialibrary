package org.yarusprog.library.facade;

import org.yarusprog.library.dto.ArticleDto;
import org.yarusprog.library.dto.PageArticlesDto;

import java.util.Date;
import java.util.List;

public interface ArticleFacade {
    List<ArticleDto> findAll();

    List<Date> findAllDates();

    PageArticlesDto findFilteredArticles(String searchText, Integer searchAuthor,
                                         Integer searchConf, Integer searchSubject,
                                         Integer searchYear, Integer pageNumber);

    int getStartGroupPagination(Integer groupId, int countGroup);

    int getEndGroupPagination(Integer groupId, int countGroup);

    int validateGroupId(Integer groupId, int countGroup);
}
