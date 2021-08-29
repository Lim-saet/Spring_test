package com.human.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	  @RequestMapping("/home")
	   public String home() {
	      return "home";
	   }
	   @RequestMapping("/login")
	   public String login() {
	      return "login";
	   }
	   @RequestMapping("/newbie")
	   public String newbie() {
	      return "newbie";
	   }

	   @RequestMapping("/room")
	   public String room(HttpServletRequest hsr) {
	      HttpSession session=hsr.getSession();
	      if(session.getAttribute("loginid")==null) {
	         return "redirect:/login";
	      }
	      return "room";
	   }
  
	@RequestMapping("/selected")
	public String doIt(HttpServletRequest hsr, Model model) {
		String strPath=hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "login";
		} else if(strPath.equals("newbie")) {
			return "newbie";
		}else {
			return "redirect:/";
		}
	}
	@RequestMapping(value="/check_user",method=RequestMethod.POST) 
		public String check_user(HttpServletRequest hsr,Model model) {
			String userid=hsr.getParameter("userid");
			String pw=hsr.getParameter("pw");
		
		HttpSession session=hsr.getSession();
		session.setAttribute("loginid",userid);
		
		return "redirect:/booking"; //RequestMapping의 경로이름
		}
		
	
	@RequestMapping(value="/booking", method=RequestMethod.GET)
	public String gobooking(HttpServletRequest hsr) {
//		model.addAttribute("loginid",uid);@RequestParam("userid") String uid
		
		HttpSession session=hsr.getSession();
		String id_already=(String)session.getAttribute("loginid");
		if(id_already.equals("aaa1")){
			return "booking";
		} else {
			return "redirect:/login";
		}
		
	}
	@RequestMapping("/logout")
	   public String logout(HttpServletRequest hsr) {
	   HttpSession session=hsr.getSession();
	      session.invalidate();
	      return "redirect:/";
	   }

	@RequestMapping("/newinfo")
	public String create(@RequestParam("realname") String rname,
						 @RequestParam("loginid") String newid,
						 @RequestParam("password") String newpw,
						 @RequestParam("ch_password") String chpw,
						 @RequestParam("mobile") String mobilenum,
						 Model model) {
		model.addAttribute("name",rname);
		model.addAttribute("id_login",newid);
		model.addAttribute("pw_f",newpw);
		model.addAttribute("checkpw",chpw);
		model.addAttribute("m_num", mobilenum);
		return "newinfo";
	}

						   
}
