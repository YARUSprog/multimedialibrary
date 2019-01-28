package org.yarusprog.library.facade;

import org.yarusprog.library.dto.ArticleDto;

import java.util.Date;
import java.util.List;

public interface ArticleFacade {
    List<ArticleDto> findAll();

    List<Date> findAllDates();

    List<ArticleDto> findFilteredArticles(final String searchText, final Integer searchAuthor,
                                          final Integer searchConf, final Integer searchSubject,
                                          final Integer searchYear);
}
