package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//@SpringBootApplication
//public class Demo1Application {
//
//    public static void main(String[] args) {
//        SpringApplication.run(Demo1Application.class, args);
//    }
//
//}

@RestController
@SpringBootApplication
public class Demo1Application {

    @RequestMapping("/")
    String home() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        SpringApplication.run(Demo1Application.class, args);
    }

}
