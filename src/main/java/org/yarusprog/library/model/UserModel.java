package org.yarusprog.library.model;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "users")
public class UserModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "password")
    private String password;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "middle_name")
    private String middleName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "details")
    private String details;

    @Column(name = "enable")
    private boolean enable;

    @Column(name = "account_non_locked")
    private boolean accountNonLocked;

    @Column(name = "teacher")
    private boolean teacher;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<FileModel> files;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<UserAttemptsModel> userAttempts;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<UserRegisterTokenModel> userRegisterTokens;

    @ManyToOne
    @JoinColumn(name = "user_role_id", referencedColumnName = "id", nullable = false)
    private UserRoleModel userRole;

    @ManyToMany
    @JoinTable(name = "user_articles", joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false), inverseJoinColumns = @JoinColumn(name = "article_id", referencedColumnName = "id", nullable = false))
    private List<ArticleModel> articles;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public boolean isAccountNonLocked() {
        return accountNonLocked;
    }

    public void setAccountNonLocked(boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }

    public boolean isTeacher() {
        return teacher;
    }

    public void setTeacher(boolean teacher) {
        this.teacher = teacher;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserModel userModel = (UserModel) o;
        return id == userModel.id &&
                enable == userModel.enable &&
                accountNonLocked == userModel.accountNonLocked &&
                teacher == userModel.teacher &&
                Objects.equals(password, userModel.password) &&
                Objects.equals(firstName, userModel.firstName) &&
                Objects.equals(middleName, userModel.middleName) &&
                Objects.equals(lastName, userModel.lastName) &&
                Objects.equals(email, userModel.email) &&
                Objects.equals(details, userModel.details);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, password, firstName, middleName, lastName, email, details, enable, accountNonLocked, teacher);
    }

    public List<FileModel> getFiles() {
        return files;
    }

    public void setFiles(List<FileModel> files) {
        this.files = files;
    }

    public List<UserAttemptsModel> getUserAttempts() {
        return userAttempts;
    }

    public void setUserAttempts(List<UserAttemptsModel> userAttempts) {
        this.userAttempts = userAttempts;
    }

    public List<UserRegisterTokenModel> getUserRegisterTokens() {
        return userRegisterTokens;
    }

    public void setUserRegisterTokens(List<UserRegisterTokenModel> userRegisterTokens) {
        this.userRegisterTokens = userRegisterTokens;
    }

    public UserRoleModel getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRoleModel userRole) {
        this.userRole = userRole;
    }

    public List<ArticleModel> getArticles() {
        return articles;
    }

    public void setArticles(List<ArticleModel> articles) {
        this.articles = articles;
    }
}
