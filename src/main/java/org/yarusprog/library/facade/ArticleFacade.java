package org.yarusprog.library.facade;

import org.yarusprog.library.dto.ArticleDto;

import java.util.List;

public interface ArticleFacade {
    List<ArticleDto> findAll();
}
