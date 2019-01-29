package org.yarusprog.library.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.yarusprog.library.model.ArticleModel;
import org.yarusprog.library.repository.ArticleRepository;
import org.yarusprog.library.service.ArticleService;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    @Override
    public List<ArticleModel> findAll() {
        return articleRepository.findAll();
    }

    @Override
    public Page<ArticleModel> findFilteringArticle(final String title, final Integer searchAuthor,
                                                    final Integer searchConf, final Integer searchSubject,
                                                    final Integer searchYear, final Integer pageNumber,
                                                    final Integer pageSize) {
        PageRequest pageRequest = new PageRequest(pageNumber, pageSize);
        final String titleForLike = "%" + (Objects.isNull(title) ? StringUtils.EMPTY : title.toUpperCase()) + "%";
        return articleRepository.findFilteredArticles(titleForLike, searchAuthor, searchConf, searchSubject,
                searchYear, pageRequest);
    }

    @Override
    public List<Date> findAllDates() {
        return articleRepository.findAllByOrderByUpdateDateAsc();
    }

    @Override
    public int getStartGroupPagination(Integer groupId, int countGroup){
        groupId = validateGroupId(groupId, countGroup);
        int startGroup;
        if(groupId <= 2 )
            startGroup = 0;
        else if(groupId <= countGroup-3)
            startGroup = groupId - 2;
        else if(countGroup < 5){
            startGroup = 0;
        } else
            startGroup = countGroup-5;
        return startGroup;
    }

    @Override
    public int getEndGroupPagination(Integer groupId, int countGroup){
        groupId = validateGroupId(groupId, countGroup);
        if (groupId < 0) {
            return 0;
        }
        int endGroup;
        if(countGroup < 5)
            endGroup = countGroup-1;
        else if(groupId <= 2 )
            endGroup = 4;
        else if(groupId <= countGroup-3)
            endGroup = groupId + 2;
        else
            endGroup = countGroup-1;
        return endGroup;
    }

    @Override
    public int validateGroupId(Integer groupId, int countGroup){
        if (groupId == null || groupId < 0)
            groupId = 0;
        else if (groupId > countGroup-1)
            groupId = countGroup-1;
        return groupId;
    }
}
