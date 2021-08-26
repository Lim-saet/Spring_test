package com.human.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
//	@RequestMapping(value = "/what", method= RequestMethod.GET)
//	public String home1(Locale locale, Model m) {
//		m.addAttribute("m_feel","졸려요");
//		return "member";
//	}
//	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("myAdress", "충남 천안시 동남구");
		model.addAttribute("myMobile","010-1234-5678");
		
		return "home";
	}

	@RequestMapping("/info")
//	public String doInfo(HttpServletRequest hsr, Model model) {
//		String uid=hsr.getParameter("userid");
//		String addr=hsr.getParameter("address");
	public String doInfo(@RequestParam("userid") String uid,
						 @RequestParam("address") String addr, 
						 Model model) {
		model.addAttribute("loginid",uid);
		model.addAttribute("region",addr);
		return "viewinfo";
	}
	
	@RequestMapping("/getinfo")
	public String getInfo(Model model) {
			return "getinfo";
	}
	
	@RequestMapping("/choose")
	public String dochoose() {
		return "choose";
	}
	@RequestMapping("/selected")
//	public String doJob(HttpServletRequest hsr, Model model) 
	public String doJob(@RequestParam("path") String strPath, Model model){
//		String strPath=hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "getinfo";
		} else if (strPath.equals("newperson")) {
			return "newperson";
		} else {
			return "choose";
		}
	}
	@RequestMapping("/today/{daynumber}")
	public String showNumber(@PathVariable int dayNumber,
							Model model) {
		model.addAttribute("day_num",dayNumber);
//		model.addAttribute("addr",address);
//		model.addAttribute("uid",userid);/{address}/{userid}@PathVariable String address, 
//							@PathVariable String userid,
		return "today";
	}
	
}
