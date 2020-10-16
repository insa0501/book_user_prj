package kr.co.sist.user.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.user.pagination.PageVO;
import kr.co.sist.user.pagination.PaginationService;
import kr.co.sist.user.pagination.TotalCntVO;
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
	public String qnaListPage(HttpSession session, Model model, SelectQnaVO sqVO, @RequestParam(defaultValue = "1") int current_page) {
		
		PaginationService ps = new PaginationService(); //페이지네이션
		
		sqVO.setId( (String)session.getAttribute("id"));//session에서 user_id 얻기
		sqVO.setStart_num(ps.startNum(current_page));
		sqVO.setEnd_num(ps.endNum(current_page));

		TotalCntVO tcVO=new TotalCntVO();
		tcVO.setUser_id((String)session.getAttribute("id"));
		System.out.println(tcVO);
		
		PageVO pVO = ps.calcPagingQna(current_page, tcVO);
		QnaService qs = new QnaService();
		int cnt=qs.searchQnaListCnt(sqVO.getId());
		qs.searchQnaList(sqVO);
		
		model.addAttribute("qna_select", qs.searchQnaList(sqVO)); //qna목록
		model.addAttribute("totalCnt", cnt); //qna목록
		model.addAttribute("pageScale",ps.pageScale() ); //qna목록
		model.addAttribute("paging", pVO); //페이지네이션
		
		System.out.println("current Page=====================>" + pVO.getCurrent_page());
		System.out.println("start Page=====================>" + pVO.getStart_page());
		System.out.println("end Page=====================>" + pVO.getEnd_page());
		System.out.println("pre Page=====================>" + pVO.getPre_page());
		System.out.println("next Page=====================>" + pVO.getNext_page());
		System.out.println("total Page=====================>" + pVO.getTotal_page());

		
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
