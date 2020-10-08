package kr.co.sist.user.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpSession;
@Controller
public class MainController {
	
	@RequestMapping(value="/main_index.do", method=GET)
	public String mainIndex() {
		
		
		
		return "main/index";
	} // mainPage()
	
	
	/*���� �׳� ���������� �����̶� �����س��� ��*/
	@RequestMapping(value="/mypage_form.do", method=GET)
	public String mypageForm(HttpSession session) {
		
		
		return "customer_service/mypage_order_list";
	} // mypageForm()
	
	/*
	 * bookController���� �˻� �� �����ִ� method ����
	 * @RequestMapping(value="/main_search_form.do", method=GET) public String
	 * searchForm() { return ""; } // searchForm()
	 */
	
  	@RequestMapping(value = "/user_book_search_frm.do", method = GET)
	  public String bookSearchForm() {
	  
	     return "book_search/user_book_search_frm";
	   }
	
	
	
	@RequestMapping(value="/main_support.do", method=GET)
	public String supportPage() {
		return "";
	} // supportPage()
	
	
	
	
	@RequestMapping(value="/event_main.do", method=GET)
	public String eventPage() {
		return "main/event_main";
	} 
	
	@RequestMapping(value="/event_detail.do", method=GET)
	public String eventDetailPage() {
		return "main/event_detail";
	} 
	
	
	
	
	
	
	
} // class