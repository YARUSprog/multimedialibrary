package org.yarusprog.library.dto;

public class FileDto {
    private String pathToFile;
    private long user;

    public FileDto() {
    }

    public FileDto(String pathToFile, long user) {
        this.pathToFile = pathToFile;
        this.user = user;
    }

    public String getPathToFile() {
        return pathToFile;
    }

    public void setPathToFile(String pathToFile) {
        this.pathToFile = pathToFile;
    }

    public long getUser() {
        return user;
    }

    public void setUser(long user) {
        this.user = user;
    }
}
