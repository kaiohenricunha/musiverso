package com.khsdc.controller;

import com.khsdc.model.User;
import com.khsdc.repository.UserRepository;
import com.khsdc.security.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping(value = "login")
public class LoginController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    UserSession userSession;

    @RequestMapping(value = "doLogin", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "doLogin", method = RequestMethod.POST)
    public String doLogin(@RequestParam("username") String username,
                          @RequestParam("password") String password,
                          Map<String, Object> model) {

        User u = userRepository.findByUsername(username);
        if(u != null && u.getPassword().equals(password)) {
            userSession.addLoggedUser(u);
            return "redirect:/user/list";
        } else {
            model.put("message", "Invalid Username/Login");
            return "login";
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout() {
        userSession.removeLoggedUser();
        return "login";
    }
}
