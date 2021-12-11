package com.khsdc.controller;

import com.khsdc.model.Song;
import com.khsdc.model.User;
import com.khsdc.repository.SongRepository;
import com.khsdc.repository.UserRepository;
import com.khsdc.security.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    SongRepository songRepository;
    @Autowired
    UserSession userSession;

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String create() {
        return "/user/create";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String createUser(Map<String, Object> model,
                                    @RequestParam("email") String email,
                                    @RequestParam("name") String name,
                                    @RequestParam("username") String username,
                                    @RequestParam("password") String password,
                                    @RequestParam("song-title") String songTitle,
                                    @RequestParam("song-link") String songLink) {
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        user.setEmail(email);
        user.setUsername(username);
        Song song = new Song(songTitle, songLink);
        user.setSong(song);
        songRepository.save(song);
        userRepository.save(user);
        String message = name + " succesfully subscribed with the song " + song.getSongName();
        model.put("message", message);
        return "/user/create";
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Map<String, Object> model) {
        Iterable<User> allUsers = userRepository.findAll();
        model.put("userList", allUsers);
        // coloca no model o usuario da sessao
        model.put("userSession", userSession);
        return "/user/list";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String edit(@RequestParam("id") Long id, Map<String, Object> model) {
        User user = userRepository.findOne(id);
        model.put("user", user);
        return "/user/edit";
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public void editPost(@RequestParam("name") String name, @RequestParam("id") Long id,
                       @RequestParam("email") String email,
                       @RequestParam("username") String username,
                       @RequestParam("password") String password,
                       @RequestParam("song-title") String songTitle,
                       @RequestParam("song-link") String songLink,
                       Map<String, Object> model) {
        User user = userRepository.findOne(id);
        Song song = user.getSong();
        user.setName(name);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        song.setSongName(songTitle);
        song.setSongLink(songLink);
        songRepository.save(song);
        userRepository.save(user);
        model.put("user", user);
        model.put("message", "User " + name + " edited.");
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) {
        userRepository.delete(id);
        songRepository.delete(id);
        return "redirect:/user/list";
    }
}
