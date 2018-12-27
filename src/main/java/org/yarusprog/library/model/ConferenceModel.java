package org.yarusprog.library.model;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "conference")
public class ConferenceModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "details")
    private String details;

    @OneToMany(mappedBy = "conference", fetch = FetchType.LAZY)
    private List<ArticleModel> articles;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "conference_subjects", catalog = "multimedialibrary_db", schema = "public", joinColumns = @JoinColumn(name = "conference_id", referencedColumnName = "id", nullable = false), inverseJoinColumns = @JoinColumn(name = "subject_id", referencedColumnName = "id", nullable = false))
    private List<SubjectModel> subjects;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ConferenceModel that = (ConferenceModel) o;
        return id == that.id &&
                Objects.equals(name, that.name) &&
                Objects.equals(details, that.details);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, details);
    }

    public List<ArticleModel> getArticles() {
        return articles;
    }

    public void setArticles(List<ArticleModel> articles) {
        this.articles = articles;
    }

    public List<SubjectModel> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<SubjectModel> subjects) {
        this.subjects = subjects;
    }
}
