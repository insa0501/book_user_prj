package kr.co.sist.user.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.user.member.vo.MemberJoinVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MemberJoinController {

	@RequestMapping(value="/dup_id.do", method=GET)
	public String dupId(String check_id, Model model) {
		
		return "member_join/dup_id";
	} // dupId
	
	@RequestMapping(value="/member_join.do", method=POST)
	public String dupId(HttpServletRequest request, MemberJoinVO mjVO) {
		
		return "member_join/dup_id";
	} // dupId
} // class