package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HappyHouseController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/aptlist")
	public String aptlist() {
		return "aptlist";
	}
	@GetMapping("/main")
	public String main() {
		return "main";
	}

}
