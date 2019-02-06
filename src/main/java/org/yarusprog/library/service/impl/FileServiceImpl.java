package org.yarusprog.library.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.yarusprog.library.model.FileModel;
import org.yarusprog.library.model.UserModel;
import org.yarusprog.library.repository.FileRepository;
import org.yarusprog.library.service.FileService;
import org.yarusprog.library.service.UserService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class FileServiceImpl implements FileService {

    private static final Logger LOGGER = LoggerFactory.getLogger(FileServiceImpl.class);

    @Value("${upload.images.path}")
    private static String uploadPath;

    @Autowired
    private FileRepository fileRepository;

    @Autowired
    private UserService userService;

    @Override
    public FileModel save(FileModel file) {
        return fileRepository.save(file);
    }

    @Override
    public void save(final MultipartFile multipartFile) {
        FileModel fileModel = new FileModel();
        String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
        UserModel user = userService.findUserByEmail(userEmail);
        final String pathToUserFile = uploadPath + user.getId() + "/";

        new File(uploadPath).mkdir();
        new File(pathToUserFile).mkdir();
        final Path filePath = Paths.get(pathToUserFile, multipartFile.getOriginalFilename());
        try {
            Files.write(filePath, multipartFile.getBytes());
        } catch (IOException e) {
            LOGGER.error(e.getMessage(), e);
        }

        fileModel.setUser(user);
        fileModel.setPathToFile(pathToUserFile + multipartFile.getOriginalFilename());
        save(fileModel);

        LOGGER.info("File " + multipartFile.getOriginalFilename() + " for user " + user.getEmail() + " successfully uploaded !");
    }
}
