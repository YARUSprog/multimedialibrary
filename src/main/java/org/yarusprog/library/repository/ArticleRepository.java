package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.ArticleModel;

@Repository("articleRepository")
public interface ArticleRepository extends JpaRepository<ArticleModel, Long> {
}
