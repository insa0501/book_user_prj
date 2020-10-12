package kr.co.sist.user.login.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.sist.user.login.domain.UserLoginDomain;
import kr.co.sist.user.login.service.LoginService;
import kr.co.sist.user.login.vo.SelectUserIdVO;
import kr.co.sist.user.login.vo.SelectUserPassVO;
import kr.co.sist.user.login.vo.UpdateUserPassVO;
import kr.co.sist.user.login.vo.UserLoginVO;

@SessionAttributes({"id","data"})
@Controller
public class UserLoginController {

	/**
	 * 회원가입버튼 -약관 페이지로 이동
	 * @return
	 */
	@RequestMapping(value="/agreement.do", method=GET)
	public String agreementPage() {
		return "member_join/agreement";
	} // agreementPage()
	
	/**
	 * 약관페이지 -> 회원가입 페이지로 이동
	 * @return
	 */
	@RequestMapping(value="/member_join_form.do", method=GET)
	public String memberJoinForm() {
		return "member_join/member_join_form";
	} // memberJoinForm
	
	/**
	 * 로그인 페이지
	 * @param user_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login_form.do", method=GET)
	public String loginForm(@CookieValue(value="user_id", defaultValue = "") String user_id, Model model) {
		model.addAttribute("user_id", user_id);
		
		return "login/login_form";
	} // loginForm()
	
	/**
	 * 로그인 프로세스
	 * @param ulVO
	 * @param request
	 * @param response
	 * @return
	 * @throws SQLException
	 * @throws NullPointerException
	 */
	@RequestMapping(value="/login_process.do", method=POST)
	public String loginProcess(UserLoginVO ulVO, HttpServletRequest request, HttpServletResponse response) throws SQLException, NullPointerException {
		
		LoginService ls = new LoginService();
		UserLoginDomain uld = ls.login(ulVO);
		
		//쿠키 심기(아이디 저장)
		if(request.getParameter("remember_chk")!=null) {
			Cookie cookie = new Cookie("user_id", uld.getUser_id());
			cookie.setMaxAge(60*60*24*365);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("user_id", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}//end else
		
		HttpSession session = request.getSession();
		session.setAttribute("id", uld.getUser_id());
		session.setAttribute("data", uld);
		
		return "book/book_main";
	} // loginProcess(UserLoginVO, HttpSession)
	
	/**
	 * 로그아웃
	 * @param ss
	 * @return
	 */
	@RequestMapping(value="/logout_process.do", method= {GET,POST})
	public String logoutProcess(SessionStatus ss) {
		
		ss.setComplete();
		
		return "book/book_main";
	}//logoutProcess
	
	/**
	 * 아이디 찾기 페이지
	 * @return
	 */
	@GetMapping(value="/find_id_form.do")
	public String findIdForm() {
		return "login/find_id_form";
	}//findIdForm
	
	/**
	 * 아이디찾기 프로세스
	 * @param suiVO
	 * @param model
	 * @return
	 * @throws SQLException
	 */
	@PostMapping(value="/find_id.do")
	public String findUserId(SelectUserIdVO suiVO, Model model) throws SQLException {
		
		LoginService ls = new LoginService();
		
		model.addAttribute("user_id", ls.searchUserId(suiVO));
		
		return "login/find_id_result";
	}//findUserId
	
	/**
	 * 비번 찾기 페이지
	 * @return
	 */
	@GetMapping(value="/find_pass_form.do")
	public String findPassForm() {
		return "login/find_pw_form";
	}//findPassForm
	
	/**
	 * 비번찾기 프로세스
	 * @param supVO
	 * @param model
	 * @return
	 * @throws SQLException
	 */
	@PostMapping(value="/find_pass.do")
	public String findUserPass(SelectUserPassVO supVO, Model model) throws SQLException {
		
		LoginService ls = new LoginService();
		String user_id = ls.searchUserPass(supVO);
		
		model.addAttribute("user_id", user_id);
		
		return "login/find_pw_change";
	}//findUserId

	/**
	 * 비번변경
	 * @return
	 * @throws SQLException 
	 */
	@PostMapping(value="/change_pass.do")
	public String changePass(UpdateUserPassVO uupVO, Model model) throws SQLException {
		
		LoginService ls = new LoginService();
		boolean updateFlag = ls.changeUserPass(uupVO);
		
		model.addAttribute("updateFlag", updateFlag);
		
		return "login/login_form";
	}//changePass
	
//	/**
//	 * SQL 예외처리
//	 * @param se
//	 * @return
//	 */
//	@ExceptionHandler(SQLException.class)
//	public ModelAndView loginException(SQLException se) {
//		ModelAndView mav = new ModelAndView();
//		
//		mav.setViewName("login/login_form");
//		mav.addObject("err_msg", "아이디나 비밀번호를 확인해주세요.");
//		
//		return mav;
//	}//loginException
	
	/**
	 * 아이디 비번 틀렸을 때 예외처리
	 * @param se
	 * @return
	 */
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView loginException(NullPointerException npe) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login/login_form");
		mav.addObject("err_msg", "아이디나 비밀번호를 확인해주세요.");
		
		return mav;
	}//loginException
	
} // class