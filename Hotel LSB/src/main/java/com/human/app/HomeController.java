package com.human.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	@Autowired
	private SqlSession sqlSession;
	
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
	   public String room(HttpServletRequest hsr,Model model) {
	      HttpSession session=hsr.getSession();
	      if(session.getAttribute("loginid")==null) {
	         return "redirect:/login";
	      }
	      //여기서 interface 호출하고 결과를 room.jsp에 전달
	      iRoom room=sqlSession.getMapper(iRoom.class);
	      //그 암튼 나는 베껴쓸 때 ㅐ자주 쓰는 방법인데 처음보는 문장구조면 컨트롤로 디플리케이션 확인하면 편해
	      //색깔들어오는거보이지 컨트롤 +마우스 클릭 or 마우스 오버하면됑ㅎㅇㅎ 그래서 duplicated variable <- 변수명 중복 같은거 예방할 때도 좋고 암튼.. 

	      ArrayList<Roominfo> roominfo=room.getRoomList();
	      model.addAttribute("list",roominfo);
	      
	      ArrayList<Roomtype> roomtype=room.getRoomType();
	      model.addAttribute("type",roomtype);
	      
//	        iRoom room_type=sqlSession.getMapper(iRoom.class);
//			ArrayList<Roomtype> roomtype=room_type.getRoomType();
//			model.addAttribute("list2",roomtype); 이런식으로 햇음.
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
		
			//DB에서 유저확인: 기존유저면 booking,없으면 home으로 
		HttpSession session=hsr.getSession();
		session.setAttribute("loginid",userid);
		
		return "redirect:/booking"; //RequestMapping의 경로이름
		}
		
	
	@RequestMapping(value="/booking", method=RequestMethod.GET)
	public String gobooking(HttpServletRequest hsr) {
//		model.addAttribute("loginid",uid);@RequestParam("userid") String uid
		
		HttpSession session=hsr.getSession();
		String id_already=(String)session.getAttribute("loginid");
		if(id_already.equals("") || ("loginid")==null){
			return "redirect:/login";
		} else {
			return "booking"; //jsp파일이름
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
