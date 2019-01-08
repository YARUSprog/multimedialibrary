package org.yarusprog.library.service;

import org.yarusprog.library.model.ArticleModel;

import java.util.List;

public interface ArticleService {
    List<ArticleModel> findAll();
}
