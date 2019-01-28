package org.yarusprog.library.service;

import org.yarusprog.library.model.ArticleModel;

import java.util.Date;
import java.util.List;

public interface ArticleService {
    List<ArticleModel> findAll();

    List<ArticleModel> findFilteringArticle(String title, Integer searchAuthor,
                                            Integer searchConf, Integer searchSubject,
                                            Integer searchYear);

    List<Date> findAllDates();
}
