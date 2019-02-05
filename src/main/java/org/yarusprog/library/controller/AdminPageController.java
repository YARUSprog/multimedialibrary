package org.yarusprog.library.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeType;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.yarusprog.library.dto.ArticleDto;
import org.yarusprog.library.dto.CreateArticleDto;
import org.yarusprog.library.facade.ArticleFacade;
import org.yarusprog.library.facade.ConferenceFacade;
import org.yarusprog.library.facade.SubjectFacade;
import org.yarusprog.library.facade.UserFacade;

import java.util.Arrays;
import java.util.Objects;

@Controller
public class AdminPageController {

    private static final Logger logger = LoggerFactory.getLogger(AdminPageController.class);

    @Autowired
    private UserFacade userFacade;

    @Autowired
    private ArticleFacade articleFacade;

    @Autowired
    private SubjectFacade subjectFacade;

    @Autowired
    private ConferenceFacade conferenceFacade;

    @GetMapping("/admin")
    public String getAdmin(Model model) {
//        model.addAttribute("newUsers", userFacade.findNewUsers());
//        userFacade.findNewUsers();
        return "admin";
    }

    @GetMapping("/notActivatedUsers")
    public String getNotActivatedUsers(Model model) {
        model.addAttribute("newUsers", userFacade.findNewUsers());
        userFacade.findNewUsers();
        return "fragments/notActivatedUsers";
    }

    @PostMapping("/article")
    @ResponseBody
    public ResponseEntity createArticle(Model model, @RequestBody @Valid CreateArticleDto article, BindingResult bindingResult) {
        HttpHeaders headers = new HttpHeaders();
        logger.warn("Test articleDto data: " + article);
        if (bindingResult.hasErrors()) {
            ObjectError error = bindingResult.getAllErrors().stream().findFirst().get();
            headers.set("message",  error.getDefaultMessage());
            return new ResponseEntity(headers, HttpStatus.EXPECTATION_FAILED);
        }

        if (Objects.isNull(articleFacade.save(article))) {
            headers.set("message", "Статтю створити не вдалося !");
            return new ResponseEntity(headers, HttpStatus.CONFLICT);
        }

        headers.set("message",  "Стаття успішно створена !");
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON_UTF8));
        return new ResponseEntity(headers, HttpStatus.CREATED);
    }

    @GetMapping("/users")
    public String getUsers(Model model) {
        return "fragments/users";
    }

    @GetMapping("/createArticle")
    public String getCreateArticle(Model model) {
        model.addAttribute("allUsers", userFacade.findAllAuthors());
        model.addAttribute("allConferences", conferenceFacade.findAll());
        model.addAttribute("allSubjects", subjectFacade.findAll());
        return "fragments/createArticle";
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/activateUser/{id}", method = RequestMethod.PUT)
    public void activateUser(@PathVariable final long id) {
        userFacade.activateUser(id);
//        return "redirect:/admin";
    }

    @GetMapping("/conferences")
    @ResponseStatus(value = HttpStatus.CREATED)
    public String getConferences(Model model) {
        return "fragments/conferences";
    }

    @GetMapping("/subjects")
    @ResponseStatus(value = HttpStatus.CREATED)
    public String getSubjects(Model model) {
        return "fragments/subjects";
    }
}
