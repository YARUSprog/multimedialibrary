package org.yarusprog.library.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.yarusprog.library.dto.UserDto;
import org.yarusprog.library.facade.UserFacade;
import org.yarusprog.library.model.Role;
import org.yarusprog.library.model.User;
import org.yarusprog.library.repository.RoleRepository;
import org.yarusprog.library.service.UserService;

@Controller
public class MultimediaLibraryController {

    @Autowired
    private UserFacade userFacade;

    @Autowired
    private RoleRepository roleRepository;

    @Value("${welcome.message}")
    private String message = "Hello World";

    @GetMapping("/")
    public String sayHello(@RequestParam(name="name", required=false) String name, Model model) {
        model.addAttribute(model.addAttribute("message",
                StringUtils.isEmpty(name) ? message : name)
        );
        return "welcome";
    }


    @GetMapping("/test")
    public String home1() {
        return "/home";
    }

    @GetMapping("/home")
    public String home() {
        return "/home";
    }

    @Secured("ADMIN")
//    @PreAuthorize("hasAnyRole('ADMIN')")
    @GetMapping("/admin")
    public String admin() {
        return "/admin";
    }

    @Secured({"ADMIN","USER"})
    @GetMapping("/user")
    public String user() {
        return "/user";
    }

    @GetMapping("/about")
    public String about() {
        return "/about";
    }

    @GetMapping("/login")
    public String login(
            @RequestParam(defaultValue = "false") boolean error, @RequestParam(defaultValue = "false") boolean logout,
            Model model) {
        model.addAttribute("error", error);
        model.addAttribute("logout", logout);
        return "/login";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("user", new UserDto());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") UserDto user, BindingResult bindingResult, Model model) {
//        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            bindingResult.getFieldErrors().forEach(fieldError -> {
                model.addAttribute(fieldError.getField() + "Error", fieldError.getDefaultMessage());
            });

            return "registration";
        }

//        userFacade.saveUser(userDto);
//        userFacade.autoLogin(userDto);

        return "redirect:/home";
    }


    @GetMapping("/403")
    public String error403() {
        return "/error/403";
    }



    @GetMapping("/registrationTemp")
    public String registrationTemp(Model model) {
        model.addAttribute("userForm", new User());

        Role role = new Role();
        role.setName("ADMIN");
        role = roleRepository.save(role);

        UserDto userDto = new UserDto();
        userDto.setEmail("yarusprog@gmail.com");
        userDto.setPassword("yarusprog@gmail.com");
        userDto.setLastName("musiienko");
        userDto.setName("yaroslav");
        userFacade.saveUser(userDto);
        return "login";
    }
}
