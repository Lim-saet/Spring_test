package com.human.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController2 {
	@RequestMapping(value="/calling",method=RequestMethod.GET) 
		public String sample1(Model model) {
			model.addAttribute("mobile","041-123-4567");
			return "company";
		}
	}

