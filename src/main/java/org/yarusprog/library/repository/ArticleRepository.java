package org.yarusprog.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.yarusprog.library.model.ArticleModel;

import java.util.Date;
import java.util.List;

@Repository("articleRepository")
public interface ArticleRepository extends JpaRepository<ArticleModel, Long> {

    @Query("select distinct updateDate from ArticleModel order by updateDate ASC")
    List<Date> findAllByOrderByUpdateDateAsc();

    @Query("SELECT distinct a " +
            "FROM ArticleModel a " +
            "JOIN a.users u " +
            "JOIN a.subjects s " +
            "JOIN a.conference c " +
            "WHERE (:title IS NULL OR :title='' OR UPPER(a.title) like :title) " +
            "AND (:searchAuthor IS NULL OR :searchAuthor=0 OR u.id=:searchAuthor) " +
            "AND (:searchConf IS NULL OR :searchConf=0 OR c.id=:searchConf) " +
            "AND (:searchSubject IS NULL OR :searchSubject=0 OR s.id=:searchSubject) " +
            "AND (:searchYear IS NULL OR :searchYear=0 OR year(a.updateDate)=:searchYear)")
    List<ArticleModel> findFilteredArticles(@Param("title") final String title,
                                            @Param("searchAuthor") final Integer searchAuthor,
                                            @Param("searchConf") final Integer searchConf,
                                            @Param("searchSubject") final Integer searchSubject,
                                            @Param("searchYear") final Integer searchYear);
}
