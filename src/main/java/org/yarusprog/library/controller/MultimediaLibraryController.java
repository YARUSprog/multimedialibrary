package org.yarusprog.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.facade.ArticleFacade;
import org.yarusprog.library.facade.ConferenceFacade;
import org.yarusprog.library.facade.SubjectFacade;
import org.yarusprog.library.facade.UserFacade;

import javax.validation.Valid;
import java.util.Objects;

@Controller
public class MultimediaLibraryController {

    @Autowired
    private UserFacade userFacade;

    @Autowired
    private ArticleFacade articleFacade;

    @Autowired
    private SubjectFacade subjectFacade;

    @Autowired
    private ConferenceFacade conferenceFacade;

    @GetMapping({"/", "/index"})
    public String getIndex(@RequestParam(value = "searchText", required = false) final String searchText,
                           @RequestParam(value = "searchAuthor", required = false) final Integer searchAuthor,
                           @RequestParam(value = "searchConf", required = false) final Integer searchConf,
                           @RequestParam(value = "searchSubject", required = false) final Integer searchSubject,
                           @RequestParam(value = "searchYear", required = false) final Integer searchYear,
                           Model model) {
        model.addAttribute("searchText", searchText);
        model.addAttribute("searchAuthor", searchAuthor);
        model.addAttribute("searchConf", searchConf);
        model.addAttribute("searchSubject", searchSubject);
        model.addAttribute("searchYear", searchYear);

        model.addAttribute("allAuthors", userFacade.findAllAuthors());
        model.addAttribute("allConferences", conferenceFacade.findAll());
        model.addAttribute("allSubjects", subjectFacade.findAll());
        model.addAttribute("allDates", articleFacade.findAllDates());

        model.addAttribute("articles",
                articleFacade.findFilteredArticles(searchText, searchAuthor, searchConf, searchSubject, searchYear));
        return "index";
    }

    @GetMapping("/contacts")
    public String contacts() {
        return "contacts";
    }

    @GetMapping("/admin")
    public String getAdmin(Model model) {
        model.addAttribute("newUsers", userFacade.findNewUsers());
        userFacade.findNewUsers();
        return "admin";
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/activateUser/{id}", method = RequestMethod.PUT)
    public void activateUser(@PathVariable final long id) {
        userFacade.activateUser(id);
//        return "redirect:/admin";
    }

    @GetMapping("/login")
    public String login(
            @RequestParam(defaultValue = "false") boolean error, @RequestParam(defaultValue = "false") boolean logout,
            Model model) {
        model.addAttribute("error", error);
        model.addAttribute("logout", logout);
        return "login";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("user", new UserDto());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") UserDto user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
//            bindingResult.getFieldErrors().forEach(fieldError -> {
//                model.addAttribute(fieldError.getField() + "Error", fieldError.getDefaultMessage());
//            });

            ObjectError error = bindingResult.getAllErrors().stream().findFirst().get();
            model.addAttribute("validationError", error.getDefaultMessage());

            return "registration";
        }
        if (Objects.nonNull(userFacade.findByEmail(user.getEmail()))) {
            model.addAttribute("validationError", "User with this email already registered");
            return "registration";
        }

        userFacade.registerUser(user);
//        userFacade.autoLogin(user);

        return "redirect:/index";
    }

    @GetMapping("/403")
    public String error403() {
        return "/error/403";
    }

}
