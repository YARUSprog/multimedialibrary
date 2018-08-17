package org.yarusprog.library;

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
}
