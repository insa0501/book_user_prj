package kr.co.sist.user.login.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.sist.user.login.domain.UserLoginDomain;
import kr.co.sist.user.login.service.LoginService;
import kr.co.sist.user.login.vo.UserLoginVO;
@Controller
public class UserLoginController {

//	@RequestMapping(value="/agreement.do", method=GET)
//	public String agreementPage() {
//		return "member_join/agreement";
//	} // agreementPage()
	
	@RequestMapping(value="/member_join_form.do", method=GET)
	public String memberJoinForm() {
		return "member_join/member_join_form";
	} // memberJoinForm
	
	@RequestMapping(value="/login_form.do", method=GET)
	public String loginForm() {
		return "login/login_form";
	} // loginForm()
	
	@RequestMapping(value="/login_process.do", method=POST)
	public String loginProcess(UserLoginVO ulVO, HttpSession session) throws SQLException {
		
		LoginService ls = new LoginService();
		UserLoginDomain uld = ls.login(ulVO);
		
		session.setAttribute("id", uld.getUser_id());
		session.setAttribute("data", uld);
		
		return "main/index";
	} // loginProcess(UserLoginVO, HttpSession)
	
	@RequestMapping(value="/logout_process.do", method=GET)
	public String logoutProcess(SessionStatus ss) {
		
		ss.setComplete();
		
		return "main/index";
	}//logoutProcess
	
	@GetMapping(value="/find_id_form.do")
	public String findIdForm() {
		return "login/find_id_form";
	}//findIdForm
	
//	@PostMapping(value="/find_id.do")
//	public String findUserId(SelectUserIdVO suiVO, Model model) {
//		return "login/find_id_result";
//	}//findUserId
	
	@GetMapping(value="/find_pass_form.do")
	public String findPassForm() {
		return "login/find_pw_form";
	}//findPassForm
	
//	@PostMapping(value="/find_pass.do")
//	public String findUserPass(SelectUserPassVO supVO, HttpSession session) {
//		return "forward:change_pass_form.do";
//	}//findUserId
//	
//	@PostMapping(value="/change_pass_form.do")
//	public String changePassForm(String id) {
//		return "login/find_pw_change";
//	}//changePassForm
//	
//	@PostMapping(value="/change_pass.do")
//	public String changePass() {
//		return "login/login_form";
//	}//changePass
	
	/**
	 * 예외처리
	 * @param se
	 * @return
	 */
	@ExceptionHandler(SQLException.class)
	public ModelAndView loginException(SQLException se) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("");
		mav.addObject("", se);
		
		return mav;
	}//loginException
	
} // class