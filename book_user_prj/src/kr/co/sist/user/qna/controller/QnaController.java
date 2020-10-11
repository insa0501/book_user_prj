package kr.co.sist.user.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.user.qna.service.QnaService;
import kr.co.sist.user.qna.vo.QnaAddVO;
import kr.co.sist.user.qna.vo.SelectQnaVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class QnaController {
	
	/**
	 * 자주하는 질문
	 * @return
	 */
	@RequestMapping(value="/support.do", method=GET)
	public String supportPage() {
		
		return "customer_service/mypage_faq";
	} // supportPage()
	
	
	/**
	 * 내가 작성한 1대 1문의 리스트 보여주는 페이지
	 * @param session
	 * @param model
	 * @param sqVO
	 * @return
	 */
	@RequestMapping(value="/qna_list.do", method=GET)
	public String qnaListPage(HttpSession session, Model model, SelectQnaVO sqVO) {
		
		sqVO.setId( (String)session.getAttribute("id"));//session에서 user_id 얻기
		
		QnaService qs = new QnaService();
		qs.searchQnaList(sqVO);
		
		model.addAttribute("qna_select", qs.searchQnaList(sqVO));
		
		return "customer_service/mypage_myQuestion";
	} // qnaListPage()
	
	
	
	/**
	 * 1대 1문의 작성 폼만 보여주기
	 * @return
	 */
	@RequestMapping(value="/qna_add_form.do", method=GET)
	public String qnaAddForm() {
		
		return "customer_service/mypage_write_question";
	} // qnaAddForm()
	
	
	/**
	 * 1대 1문의 작성 처리(작성자 IP, 작성자 ID)
	 * @param request
	 * @param session
	 * @param qaVO
	 * @return
	 */
	@RequestMapping(value="/qna_add.do", method=GET)
	public String qnaAdd(HttpServletRequest request,HttpSession session, QnaAddVO qaVO) {
		
	   // QnaAddVO qaVO = new QnaAddVO();
	    qaVO.setQna_ip(request.getRemoteAddr()); //HttpServletRequest의 getRemoteAddr()로 사용자 ip 가져오기
		qaVO.setId((String)session.getAttribute("id")); //session에서 user_id 얻기
	    
		QnaService qs = new QnaService();
		qs.addQna(qaVO);
		
		return "redirect:qna_list.do"; //추가한 1대1문의가 mypage_myQuestion에서 보여야 함
	} // qnaAddForm()
	
	
} // class
