package org.yarusprog.library.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yarusprog.library.model.ArticleModel;
import org.yarusprog.library.repository.ArticleRepository;
import org.yarusprog.library.service.ArticleService;

import java.util.Date;
import java.util.List;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    @Override
    public List<ArticleModel> findAll() {
        return articleRepository.findAll();
    }

    @Override
    public List<ArticleModel> findFilteringArticle(final String title, final Integer searchAuthor,
                                                   final Integer searchConf, final Integer searchSubject,
                                                   final Integer searchYear) {
        return articleRepository.findFilteredArticles("%" + title.toUpperCase() + "%", searchAuthor, searchConf,
                searchSubject, searchYear);
    }

    @Override
    public List<Date> findAllDates() {
        return articleRepository.findAllByOrderByUpdateDateAsc();
    }


}
