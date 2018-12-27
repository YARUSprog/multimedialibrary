package org.yarusprog.library.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "files")
public class FileModel {

    @Id
    @Column(name = "path_to_file")
    private String pathToFile;

    @Column(name = "trash")
    private boolean trash;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    private UserModel user;

    public String getPathToFile() {
        return pathToFile;
    }

    public void setPathToFile(String pathToFile) {
        this.pathToFile = pathToFile;
    }

    public boolean isTrash() {
        return trash;
    }

    public void setTrash(boolean trash) {
        this.trash = trash;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FileModel that = (FileModel) o;
        return trash == that.trash &&
                Objects.equals(pathToFile, that.pathToFile);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pathToFile, trash);
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }
}
