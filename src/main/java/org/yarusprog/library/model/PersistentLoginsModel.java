package org.yarusprog.library.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "persistent_logins")
public class PersistentLoginsModel {

    @Id
    @Column(name = "series")
    private String series;

    @Column(name = "username")
    private String username;

    @Column(name = "token")
    private String token;

    @Column(name = "last_used")
    private Timestamp lastUsed;

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Timestamp getLastUsed() {
        return lastUsed;
    }

    public void setLastUsed(Timestamp lastUsed) {
        this.lastUsed = lastUsed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PersistentLoginsModel that = (PersistentLoginsModel) o;
        return Objects.equals(series, that.series) &&
                Objects.equals(username, that.username) &&
                Objects.equals(token, that.token) &&
                Objects.equals(lastUsed, that.lastUsed);
    }

    @Override
    public int hashCode() {
        return Objects.hash(series, username, token, lastUsed);
    }
}
