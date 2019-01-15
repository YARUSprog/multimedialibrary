package org.yarusprog.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.facade.ArticleFacade;
import org.yarusprog.library.facade.UserFacade;
import org.yarusprog.library.repository.UserRoleRepository;

import javax.validation.Valid;
import java.util.Objects;

@Controller
public class MultimediaLibraryController {

    @Autowired
    private UserFacade userFacade;

    @Autowired
    private ArticleFacade articleFacade;

    @Autowired
    private UserRoleRepository userRoleRepository;

    @GetMapping({"/", "/index"})
    public String getIndex(Model model) {
        model.addAttribute("articles", articleFacade.findAll());
        return "index";
    }

    @GetMapping("/contacts")
    public String contacts() {
        return "contacts";
    }

    @GetMapping("/admin")
    public String getAdmin() {
        return "/admin";
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

        userFacade.saveUser(user);
//        userFacade.autoLogin(user);

        return "redirect:/index";
    }

    @GetMapping("/403")
    public String error403() {
        return "/error/403";
    }

}
