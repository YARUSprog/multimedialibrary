package org.yarusprog.library.service;

import org.springframework.data.domain.Page;
import org.yarusprog.library.model.ArticleModel;

import java.util.Date;
import java.util.List;

public interface ArticleService {
    List<ArticleModel> findAll();

    Page<ArticleModel> findFilteringArticle(String title, Integer searchAuthor,
                                            Integer searchConf, Integer searchSubject,
                                            Integer searchYear, Integer pageNumber, Integer pageSize);

    List<Date> findAllDates();

    int getStartGroupPagination(Integer groupId, int countGroup);

    int getEndGroupPagination(Integer groupId, int countGroup);

    int validateGroupId(Integer groupId, int countGroup);

    ArticleModel findById(final long id);

    ArticleModel save(ArticleModel article);
}
