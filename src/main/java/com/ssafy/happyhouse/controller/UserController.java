package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.SearchCondition;
import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@GetMapping("/main")
    public String main() {
        return "main";
    }
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/regist")
	public String register() {
		return "regist";
	}
	
	@PostMapping("/regist")
	public String register(User user, Model model) throws Exception {
		logger.debug("user info : {}", user);
		userService.insert(user);
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(User user, HttpSession session, Model m) throws SQLException {
		User selected = userService.select(user.getId());
		if(selected!=null && selected.getPass().equals(user.getPass())) {
			session.setAttribute("userinfo", selected);
			return "redirect:/";
		}else {
			m.addAttribute("msg", "로그인 실패");
			return "index";			
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";  
	}
	@GetMapping("/list")
	public String list(SearchCondition condition, Model m) {
		//List<Book> books = bService.search(condition);
        //m.addAttribute("books", books);
		
		Map<String, Object> map = userService.pagingSearch(condition);
		m.addAttribute("users", map.get("users"));
		m.addAttribute("navigation", map.get("navigation"));
		return "list";
	}
}
