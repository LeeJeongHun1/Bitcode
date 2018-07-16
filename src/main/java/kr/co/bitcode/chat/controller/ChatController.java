package kr.co.bitcode.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@RequestMapping("/chat.do")
	public void chat() {
		
	}
	
	@RequestMapping("/login.do")
	@ResponseBody
	public String login(HttpSession session, Member m) {
		session.setAttribute("user", m);
		return "success";
	}

	@RequestMapping("/logout.do")
	@ResponseBody
	public String logout(HttpSession session) {
		session.invalidate();
		return "success";
	}
}
