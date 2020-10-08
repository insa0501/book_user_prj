package kr.co.sist.user.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.user.mypage.vo.UserInfoVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpSession;

@Controller
public class MypageController {
	
	@RequestMapping(value="/order_list.do", method=GET)
	public String orderListPage(HttpSession session, String term, Model model) {
		
		return "";
	} // orderListPage
	
	@RequestMapping(value="/order_remove.do", method=GET)
	public String orderRemove(HttpSession session, int order_no) {
		
		return "";
	} // orderRemove
	
	@RequestMapping(value="/user_pass_check_form.do", method=GET)
	public String userPassCheckForm() {
		
		return "";
	} // userPassCheckForm
	
	@RequestMapping(value="/user_pass_check_process.do", method=GET)
	public String userPassCheck(HttpSession session, Model model) {
		
		return "";
	} // userPassCheck
	
	@RequestMapping(value="/user_info_change_form.do", method=GET)
	public String userInfoChangeForm() {
		
		return "";
	} // userInfoChangeForm
	
	@RequestMapping(value="/user_info_change_process.do", method=GET)
	public String userInfoChange(HttpSession session, UserInfoVO uiVO, Model model) {
		
		return "";
	} // userInfoChange
	
	@RequestMapping(value="/user_resign_form.do", method=GET)
	public String userResignForm() {
		
		return "";
	} // userResignForm
	
	@RequestMapping(value="/user_resign_process.do", method=GET)
	public String userResign(HttpSession session, Model model) {
		
		return "";
	} // userResignForm
	
	
	
} // class