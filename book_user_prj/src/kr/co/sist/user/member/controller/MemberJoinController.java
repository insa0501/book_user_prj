package kr.co.sist.user.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.user.member.service.MemberJoinService;
import kr.co.sist.user.member.vo.MemberJoinVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MemberJoinController {

	@RequestMapping(value="/dup_id.do", method=GET)
	public String dupId(String check_id, Model model) {
		
		boolean DupFlag = false;
		String user_id = "";
		if(check_id != null && !"".equals(check_id)) {
			MemberJoinService mjs = new MemberJoinService();
			user_id = mjs.searchDupId(check_id);
			DupFlag = true;
		}//end if
		
		model.addAttribute("DupFlag", DupFlag);
		model.addAttribute("user_id", user_id);
		model.addAttribute("check_id", check_id);
		
		return "member_join/dup_id";
	} // dupId
	
	@RequestMapping(value="/member_join.do", method=POST)
	public String memberJoin(HttpServletRequest request, MemberJoinVO mjVO, Model model) {
		
		MemberJoinService mjs = new MemberJoinService();
		
		mjVO.setUser_ip(request.getRemoteAddr());
		mjs.memberJoin(mjVO);
		
		model.addAttribute("user_id",mjVO.getUser_id());
		
		return "member_join/join_result";
	} // dupId
} // class