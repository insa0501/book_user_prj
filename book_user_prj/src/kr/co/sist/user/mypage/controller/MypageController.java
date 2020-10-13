package kr.co.sist.user.mypage.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.sist.user.mypage.domain.OrderDetailDomain;
import kr.co.sist.user.mypage.domain.OrderListDomain;
import kr.co.sist.user.mypage.domain.UserInfoDomain;
import kr.co.sist.user.mypage.service.MypageService;
import kr.co.sist.user.mypage.vo.PageNationVO;
import kr.co.sist.user.mypage.vo.SelectOrderListVO;
import kr.co.sist.user.mypage.vo.UserCheckVO;
import kr.co.sist.user.mypage.vo.UserInfoVO;
import kr.co.sist.user.mypage.vo.UserResignVO;

@Controller
public class MypageController {
	
	private static final String TODAY = "0", ONE_MONTH = "1", THREE_MONTH = "2";
	
	/**
	 * 주문 리스트 페이지
	 * @param session
	 * @param term
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/order_list.do", method=GET)
	public String orderListPage(HttpSession session, String term, SelectOrderListVO solVO, Model model) {
		String path = "forward:login_form.do";
		
		if(session.getAttribute("id") != null) {
			path = "customer_service/my_page_order_list";
			
			solVO.setUser_id((String)session.getAttribute("id"));
			
			if(term != null) {
				Date date = new Date();
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				switch (term) {
				case TODAY: 
					cal.setTime(date);
					solVO.setStartDay(sdf.format(cal.getTime()));
					cal.add(cal.DATE, 1);
					solVO.setEndDay(sdf.format(cal.getTime()));
					break;
				case ONE_MONTH:
					cal.setTime(date);
					cal.add(cal.DATE, 1);
					solVO.setEndDay(sdf.format(cal.getTime()));
					cal.add(cal.MONTH, -1);
					solVO.setStartDay(sdf.format(cal.getTime()));
					break;
				case THREE_MONTH:
					cal.setTime(date);
					cal.add(cal.DATE, 1);
					solVO.setEndDay(sdf.format(cal.getTime()));
					cal.add(cal.MONTH, -3);
					solVO.setStartDay(sdf.format(cal.getTime()));
					break;
				}//end switch
			}//end if
			
			if(solVO.getCurrentPage() < 1) {
				solVO.setCurrentPage(1);
			}//end if
			
			MypageService ms = new MypageService();
			
			int currentPage = solVO.getCurrentPage();
			int pageScale = ms.pageScale();
			int startNum = ms.startNum(currentPage, pageScale);
			int endNum = ms.endNum(startNum, pageScale);
			int totalPage = ms.totalPage(ms.totalCount(solVO), pageScale);
			
			solVO.setStartNum(startNum);
			solVO.setEndNum(endNum);
			
			List<OrderListDomain> list = ms.searchOrderList(solVO);
			
			PageNationVO pnVO = new PageNationVO("order_list.do", term, currentPage, totalPage);
			String pageNation = ms.pageNation(pnVO);
			
			model.addAttribute("order_list", list);
			model.addAttribute("page_nation", pageNation);
		}//end if
		
		return path;
	} // orderListPage
	
	/**
	 * 주문 상세 페이지
	 * @param moVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/order_detail.do", method=GET)
	public String orderDetail(int order_no, Model model) {
		
		MypageService ms = new MypageService();
		OrderDetailDomain odd = ms.searchOrderDeatil(order_no);
		
		model.addAttribute("order_data", odd);
		
		return "customer_service/my_page_order_detail";
	} // orderListPage
	
	/**
	 * 주문 삭제
	 * @param session
	 * @param order_no
	 * @return
	 */
	@RequestMapping(value="/order_remove.do", method=GET)
	public String orderRemove(HttpSession session, int order_no, Model model) {
		
		MypageService ms = new MypageService();
		boolean remove_flag = ms.removeOrder(order_no);
		
		model.addAttribute("remove_flag", remove_flag);
		
		return "forward:order_list.do";
	} // orderRemove
	
	/**
	 * 비번 검증 페이지
	 * @return
	 */
	@RequestMapping(value="/user_pass_check_form.do", method=GET)
	public String userPassCheckForm() {
		return "customer_service/my_page_user_info_chk";
	} // userPassCheckForm
	
	/**
	 * 비번 검증 프로세스
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user_pass_check_process.do", method=POST)
	public String userPassCheck(HttpSession session, String user_pass, Model model) {
		String path = "customer_service/my_page_user_info_chk";
		
		MypageService ms = new MypageService();
		
		UserCheckVO ucVO = new UserCheckVO();
		ucVO.setUser_id((String)session.getAttribute("id"));
		ucVO.setUser_pass(user_pass);
		
		UserInfoDomain uid = ms.checkUserPass(ucVO);
		
		if(uid != null) {
			path = "customer_service/my_page_user_info_change";
			model.addAttribute("user_info", uid);
			model.addAttribute("user_pass", user_pass);
		} else {
			model.addAttribute("chk_flag", true);
		}//end else
		
		
		return path;
	} // userPassCheck
	
	/**
	 * 정보변경 프로세스
	 * @param session
	 * @param uiVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user_info_change_process.do", method=POST)
	public String userInfoChange(HttpSession session, UserInfoVO uiVO, Model model) {
		
		MypageService ms = new MypageService();
		
		uiVO.setUser_id((String)session.getAttribute("id"));
		
		boolean update_flag = ms.changeUserInfo(uiVO);
		
		model.addAttribute("update_flag", update_flag);
		
		return "customer_service/my_page_user_info_chk";
	} // userInfoChange
	
	/**
	 * 탈퇴 페이지
	 * @return
	 */
	@RequestMapping(value="/user_resign_form.do", method=GET)
	public String userResignForm() {
		
		return "customer_service/my_page_resign";
	} // userResignForm
	
	/**
	 * 탈퇴 프로세스
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user_resign_process.do", method=POST)
	public String userResign(HttpSession session, String user_pass, String[] chk, Model model) {
		String path = "customer_service/my_page_resign";
		
		MypageService ms = new MypageService();
		
		UserResignVO urVO = new UserResignVO();
		urVO.setUser_id((String)session.getAttribute("id"));
		urVO.setUser_pass(user_pass);
		
		List<String> list = new ArrayList<String>();
		for(String data : chk) {
			list.add(data);
		}//end for
		urVO.setUser_resdata(list);
		
		boolean res_flag = ms.userResign(urVO);		
		model.addAttribute("res_flag",res_flag);
		
		if(res_flag) {
			path = "forward:logout_process.do";
		}//end if
		
		return path;
	} // userResignForm
	
} // class