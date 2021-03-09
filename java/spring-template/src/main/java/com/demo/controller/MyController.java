package com.demo.controller;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {
    @RequestMapping("/")
    public String index(@RequestParam(value = "name", defaultValue = "世界") String name, Model model) {
        model.addAttribute("msg", name);
        return "index";
    }
}
