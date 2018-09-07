package org.yarusprog.library.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MultimediaLibraryController {

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

    @GetMapping("/admin")
    public String admin() {
        return "/admin";
    }

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

    @GetMapping("/403")
    public String error403() {
        return "/error/403";
    }
}
