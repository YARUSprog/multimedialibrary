package org.yarusprog.library.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "article")
public class ArticleModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "title")
    private String title;

    @Column(name = "text")
    private String text;

    @Column(name = "update_date")
    private Timestamp updateDate;

    @ManyToOne
    @JoinColumn(name = "conference_id", referencedColumnName = "id", nullable = false)
    private ConferenceModel conference;

    @ManyToMany(mappedBy = "articles", fetch = FetchType.LAZY)
    private List<UserModel> users;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "articles_subjects", catalog = "multimedialibrary_db", schema = "public", joinColumns = @JoinColumn(name = "article_id", referencedColumnName = "id", nullable = false), inverseJoinColumns = @JoinColumn(name = "subject_id", referencedColumnName = "id", nullable = false))
    private List<SubjectModel> subjects;


    public long getId() {
        return id;
    }

    public void setId(long id) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ArticleModel that = (ArticleModel) o;
        return id == that.id &&
                Objects.equals(title, that.title) &&
                Objects.equals(text, that.text) &&
                Objects.equals(updateDate, that.updateDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, text, updateDate);
    }

    public ConferenceModel getConference() {
        return conference;
    }

    public void setConference(ConferenceModel conference) {
        this.conference = conference;
    }

    public List<UserModel> getUsers() {
        return users;
    }

    public void setUsers(List<UserModel> users) {
        this.users = users;
    }

    public List<SubjectModel> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<SubjectModel> subjects) {
        this.subjects = subjects;
    }
}
