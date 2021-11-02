package com.ssafy.happyhouse.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.model.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/regist")
	public String register() {
		return "user/join";
	}
	
	@PostMapping("/regist")
	public String register(User user, Model model) throws Exception {
		logger.debug("user info : {}", user);
		userService.insert(user);
		return "redirect:/user/login";
	}
}
