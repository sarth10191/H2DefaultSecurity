package com.security.example.Controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @PreAuthorize("hasRole('User')")
    @GetMapping("/")
    public String hello(){
        return "Hello";
    }

    @PreAuthorize("hasRole('Admin')")
    @GetMapping("/students")
    public String getStudents(){
        return "All students";
    }


}
