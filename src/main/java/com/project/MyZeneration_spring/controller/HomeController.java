package com.project.MyZeneration_spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/*
 * 홈 컨트롤러
 * */

@Controller
public class HomeController {

	@GetMapping({"/"})
	public String home(HttpSession session) {
		System.out.println("[Notice] HomeController");

		if (session.getAttribute("memberId") == null) {
			session.setAttribute("memberId", "example");
		}
		System.out.println("memberId: " + session.getAttribute("memberId"));

		return "index";
	}
}
