package org.yarusprog.library.dto;

import java.util.List;

public class PageArticlesDto {
    private List<ArticleDto> content;
    private Integer totalPages;
    private Integer currentPage;

    public PageArticlesDto(List<ArticleDto> content, Integer totalPages, Integer currentPage) {
        this.content = content;
        this.totalPages = totalPages;
        this.currentPage = currentPage;
    }

    public List<ArticleDto> getContent() {
        return content;
    }

    public void setContent(List<ArticleDto> content) {
        this.content = content;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }
}
