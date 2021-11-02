package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.service.HappyHouseMapService;

@Controller
public class HappyHouseController {
	@Autowired
	private HappyHouseMapService happyHouseMapService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/aptlist")
	public String aptlist() {
		return "aptlist";
	}


}
