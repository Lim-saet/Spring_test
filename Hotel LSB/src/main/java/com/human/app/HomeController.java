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
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
	   public String dologin() {
	      return "login";
	   }
	   
	   @RequestMapping(value="/signin",method=RequestMethod.POST,
					produces = "application/text; charset=utf8")
	   	public String doSignin(HttpServletRequest hsr) {
		   System.out.println("sign");//들어감
		   String realname= hsr.getParameter("realname");
		   System.out.println("name["+realname+"]");//null값으로 들어감
		   String loginid= hsr.getParameter("loginid");
		   String password= hsr.getParameter("password");

		   iMember member=sqlSession.getMapper(iMember.class);
		   member.doSignin(realname, loginid, password);
		   
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

	      /*ArrayList<Roominfo> roominfo=room.getRoomList();
	      model.addAttribute("list",roominfo);*/
	      
			
			  ArrayList<Roomtype> roomtype=room.getRoomType();
			  model.addAttribute("type",roomtype);
			 
	      
	     
//	        iRoom room_type=sqlSession.getMapper(iRoom.class);
//			ArrayList<Roomtype> roomtype=room_type.getRoomType();
//			model.addAttribute("list2",roomtype); 이런식으로 햇음.
	      return "room";
	      
	      
	   }
	   
	   @RequestMapping(value="/booking",method=RequestMethod.GET)
	   public String booking(HttpServletRequest hsr,Model model) {
	      HttpSession session=hsr.getSession();
	      String id_already=(String)session.getAttribute("loginid");
	      if(session.getAttribute("loginid")==null || id_already.equals("")) {
	         return "redirect:/login";
	      } else {
	    	  iRoom room=sqlSession.getMapper(iRoom.class);
	    	  ArrayList<Roomtype> roomtype=room.getRoomType();
	    	  model.addAttribute("type",roomtype);
	    	  return "booking"; 
	      }
	       
	   }
	   
   @RequestMapping(value="/getRoomList",method=RequestMethod.POST,
   					produces = "application/text; charset=utf8")
   @ResponseBody
	      public String getRoomList(HttpServletRequest hsr) {
	    	  iRoom room=sqlSession.getMapper(iRoom.class);
	    	  ArrayList<Roominfo> roominfo=room.getRoomList();
	    	  //찾아진 데이터로 JSONArray 만들기
	    	  JSONArray ja= new JSONArray();
	    	  for(int i=0;i<roominfo.size();i++) {
	    		  JSONObject jo = new JSONObject();
	    		  jo.put("roomcode", roominfo.get(i).getRoomcode());
	    		  jo.put("roomname", roominfo.get(i).getRoomname());
	    		  jo.put("typename", roominfo.get(i).getTypename());
	    		  jo.put("howmany", roominfo.get(i).getHowmany());
	    		  jo.put("howmuch", roominfo.get(i).getHowmuch());
	    		  ja.add(jo);
	    	  }
	    	  System.out.println(ja.toString());
	    	  return ja.toString();
	      }
   
   @RequestMapping(value="/deleteRoom",method=RequestMethod.POST,
				produces = "application/text; charset=utf8")
   @ResponseBody
   public String deleteRoom(HttpServletRequest hsr) {
	   int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
	   iRoom room=sqlSession.getMapper(iRoom.class);
	   room.doDeleteRoom(roomcode);
	   return "ok";
   }
   
   @RequestMapping(value="/addRoom",method=RequestMethod.POST,
   			produces = "application/text; charset=utf8")
	@ResponseBody
		public String addRoom(HttpServletRequest hsr) {
			String rname=hsr.getParameter("roomname");
			String rtype=hsr.getParameter("roomtype");
			int howmany=Integer.parseInt(hsr.getParameter("howmany"));
			int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
			iRoom room=sqlSession.getMapper(iRoom.class);
			room.doAddRoom(rname,rtype,howmany,howmuch);
			return "ok";
   }
   
   @RequestMapping(value="/addBooking",method=RequestMethod.POST,
  			produces = "application/text; charset=utf8")
	@ResponseBody
		public String addBooking(HttpServletRequest hsr) {
	   System.out.println("can");
			int person=Integer.parseInt(hsr.getParameter("person"));
			String checkin=hsr.getParameter("checkin");
			 //System.out.println("checkin ["+checkin+"]");
			String checkout=hsr.getParameter("checkout");
			String name=hsr.getParameter("name");
			String mobile=hsr.getParameter("mobile");
			int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
			int total=Integer.parseInt(hsr.getParameter("total"));
			
			iBook book=sqlSession.getMapper(iBook.class);
			book.doAddBooking(person,checkin,checkout,name,mobile,roomcode,total);
			return "ok";
	}
   
   @RequestMapping(value="/getBookedList",method=RequestMethod.POST,
 			produces = "application/text; charset=utf8")
   @ResponseBody 
   		public String getBookedList(HttpServletRequest hsr) {
	   iBook book=sqlSession.getMapper(iBook.class);
	   
	   		String checkin=hsr.getParameter("checkin");
	   		String checkout=hsr.getParameter("checkout");

	   		ArrayList<Bookinfo> bookinfo=book.getBookedList(checkin,checkout);
	   		//찾아진 데이터로 JSON Array 만들기
	   		JSONArray ja=new JSONArray();
	   		for(int i=0;i<bookinfo.size();i++) {
	   			JSONObject jo = new JSONObject();
	   			jo.put("roomname", bookinfo.get(i).getRoomname());
	   			jo.put("bookcode", bookinfo.get(i).getBookcode());
	   			jo.put("max_howmany", bookinfo.get(i).getMax_howmany());
	   			jo.put("person", bookinfo.get(i).getPerson());
	   			jo.put("checkin", bookinfo.get(i).getCheckin());
	   			jo.put("checkout", bookinfo.get(i).getCheckout());
	   			jo.put("total", bookinfo.get(i).getTotal());
	   			jo.put("name", bookinfo.get(i).getName());
	   			jo.put("mobile", bookinfo.get(i).getMobile());
	   			jo.put("roomcode", bookinfo.get(i).getRoomcode());
	   			jo.put("typename", bookinfo.get(i).getTypename());
	   			ja.add(jo);
	   		}
	   		System.out.println(ja.toString());
	   		return ja.toString();
   }
   
	
	  @RequestMapping(value="/getBookList",method=RequestMethod.POST, produces =
	  "application/text; charset=utf8")
	  
	  @ResponseBody public String getBookList(HttpServletRequest hsr) { 
		  iBook book=sqlSession.getMapper(iBook.class); 
		  String checkin=hsr.getParameter("checkin"); 
		  String checkout=hsr.getParameter("checkout");
		  int typecode=Integer.parseInt(hsr.getParameter("typecode"));
		  
	  ArrayList<Bookinfo> bookinfo=book.getBookList(checkin,checkout,typecode); 
	  		JSONArray ja=new JSONArray();
	  		for(int i=0;i<bookinfo.size();i++) { 
	  			JSONObject jo = new JSONObject();
	  			jo.put("roomcode", bookinfo.get(i).getRoomcode()); 
	  			jo.put("roomname",bookinfo.get(i).getRoomname()); 
	  			jo.put("typename",bookinfo.get(i).getTypename()); 
	  			jo.put("howmany",bookinfo.get(i).getHowmany()); 
	  			jo.put("howmuch",bookinfo.get(i).getHowmuch());
	  			ja.add(jo);
	  		} 
	  		return ja.toString();
	  }
	 
	  @RequestMapping(value="/updateBook",method=RequestMethod.POST, produces =
			  "application/text; charset=utf8")
	  @ResponseBody
	  public String updateBook(HttpServletRequest hsr) {
		  iBook book=sqlSession.getMapper(iBook.class);
		  
		  int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		  String checkin=hsr.getParameter("checkin");
		  String checkout=hsr.getParameter("checkout");
		  String name=hsr.getParameter("name");
		  int mobile=Integer.parseInt(hsr.getParameter ("mobile"));
		  int total=Integer.parseInt(hsr.getParameter("total"));
		  
		  book.doUpdateBook(roomcode, checkin, checkout, name, mobile, total);
		  return"ok";
		  		
	  }
	  
	  
	  
   @RequestMapping(value="/updateRoom",method=RequestMethod.POST,
  			produces = "application/text; charset=utf8")
   @ResponseBody
   public String updateRoom(HttpServletRequest hsr) {
	   iRoom room=sqlSession.getMapper(iRoom.class);
	   System.out.println("can");
	   
	   room.doUpdateRoom(Integer.parseInt(hsr.getParameter("roomcode")),
			   hsr.getParameter("roomname"),
			   Integer.parseInt(hsr.getParameter("roomtype")),
			   Integer.parseInt(hsr.getParameter("howmany")),
			   Integer.parseInt(hsr.getParameter("howmuch"))); 
      //System.out.println("roomcode ["+roomcode+"]");
	  // System.out.println("can");
	   return "ok";			   
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
		iMember member=sqlSession.getMapper(iMember.class);
			int n = member.doCheckUser(userid,pw); 
		if(n>0) {
			HttpSession session=hsr.getSession();
			session.setAttribute("loginid", userid);////////////이어서 써야함
			return "redirect:/booking";
		} else {
			return "home";
		}
	}//일단 실행
	
		//여기 리턴이 2개네 else에서 구문 
		//return "redirect:/booking"; //RequestMapping의 경로이름
		
		
	
		/*
		 * @RequestMapping(value="/booking", method=RequestMethod.GET) public String
		 * gobooking(HttpServletRequest hsr) { //
		 * model.addAttribute("loginid",uid);@RequestParam("userid") String uid
		 * 
		 * HttpSession session=hsr.getSession(); String
		 * id_already=(String)session.getAttribute("loginid"); if(id_already.equals("")
		 * || ("loginid")==null){ return "redirect:/login"; } else { return "booking";
		 * //jsp파일이름 }
		 * 
		 * }
		 */
	
//	   @RequestMapping(value="/getRoomList2",method=RequestMethod.POST,
//					produces = "application/text; charset=utf8")
//	   @ResponseBody
//	   		public String getRoomList2(HttpServletRequest hsr) {
//		   		iRoom room=sqlSession.getMapper(iRoom.class);
//		   		ArrayList<Roominfo> roominfo=room.getRoomList2();
//				   	 JSONArray ja= new JSONArray();
//			    	  for(int i=0;i<roominfo.size();i++) {
//			    		  JSONObject jo = new JSONObject();
//			    		  jo.put("typename", roominfo.get(i).getTypename());
//			    		  jo.put("howmany", roominfo.get(i).getHowmany());
//			    		  jo.put("howmuch", roominfo.get(i).getHowmuch());
//			    		  jo.put("roomcode", roominfo.get(i).getRoomcode());
//			    		  ja.add(jo);
//	    	  }
//			  System.out.println(ja.toString());
//			  return ja.toString();
//	   }
	   
//	  @RequestMapping(value="/addBooking",method=RequestMethod.POST,
//				produces = "application/text; charset=utf8")
//	   @ResponseBody
//		public String addBooking(HttpServletRequest hsr) {
//		  	//System.out.println("can");
//		  
//		   String bname=hsr.getParameter("name");
//		   System.out.println("name ["+bname+"]");
//		   	
//		  	int max_person=Integer.parseInt(hsr.getParameter("person"));
//		  	int checkin=Integer.parseInt(hsr.getParameter("checkin"));
//		  	int checkout=Integer.parseInt(hsr.getParameter("checkout"));
//			
//			int mobile=Integer.parseInt(hsr.getParameter("mobile"));
//			iBook book=sqlSession.getMapper(iBook.class);
//			book.doAddBooking(max_person,checkin,checkout,bname,mobile);
//			return "ok";
//	}
	
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
