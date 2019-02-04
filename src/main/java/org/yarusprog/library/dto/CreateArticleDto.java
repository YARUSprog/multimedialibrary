package org.yarusprog.library.dto;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.sql.Timestamp;
import java.util.List;

public class CreateArticleDto {
    private Long id;

    @NotEmpty(message = "Please provide title")
    private String title;

    @NotEmpty(message = "Please provide text")
    private String text;

    private Timestamp updateDate;

    @NotNull(message = "Please provide conference")
    private Long conference;

    @NotNull(message = "Please provide author")
    private List<Long> users;

    @NotNull(message = "Please provide subject")
    private List<Long> subjects;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    public Long getConference() {
        return conference;
    }

    public void setConference(Long conference) {
        this.conference = conference;
    }

    public List<Long> getUsers() {
        return users;
    }

    public void setUsers(List<Long> users) {
        this.users = users;
    }

    public List<Long> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Long> subjects) {
        this.subjects = subjects;
    }

    @Override
    public String toString() {
        return "CreateArticleDto{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", text='" + text + '\'' +
                ", updateDate=" + updateDate +
                ", conference=" + conference +
                ", users=" + users +
                ", subjects=" + subjects +
                '}';
    }
}
