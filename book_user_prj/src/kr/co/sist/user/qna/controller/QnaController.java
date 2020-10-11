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
	 * �����ϴ� ����
	 * @return
	 */
	@RequestMapping(value="/support.do", method=GET)
	public String supportPage() {
		
		return "customer_service/mypage_faq";
	} // supportPage()
	
	
	/**
	 * ���� �ۼ��� 1�� 1���� ����Ʈ �����ִ� ������
	 * @param session
	 * @param model
	 * @param sqVO
	 * @return
	 */
	@RequestMapping(value="/qna_list.do", method=GET)
	public String qnaListPage(HttpSession session, Model model, SelectQnaVO sqVO) {
		
		sqVO.setId( (String)session.getAttribute("id"));//session���� user_id ���
		
		QnaService qs = new QnaService();
		qs.searchQnaList(sqVO);
		
		model.addAttribute("qna_select", qs.searchQnaList(sqVO));
		
		return "customer_service/mypage_myQuestion";
	} // qnaListPage()
	
	
	
	/**
	 * 1�� 1���� �ۼ� ���� �����ֱ�
	 * @return
	 */
	@RequestMapping(value="/qna_add_form.do", method=GET)
	public String qnaAddForm() {
		
		return "customer_service/mypage_write_question";
	} // qnaAddForm()
	
	
	/**
	 * 1�� 1���� �ۼ� ó��(�ۼ��� IP, �ۼ��� ID)
	 * @param request
	 * @param session
	 * @param qaVO
	 * @return
	 */
	@RequestMapping(value="/qna_add.do", method=GET)
	public String qnaAdd(HttpServletRequest request,HttpSession session, QnaAddVO qaVO) {
		
	   // QnaAddVO qaVO = new QnaAddVO();
	    qaVO.setQna_ip(request.getRemoteAddr()); //HttpServletRequest�� getRemoteAddr()�� ����� ip ��������
		qaVO.setId((String)session.getAttribute("id")); //session���� user_id ���
	    
		QnaService qs = new QnaService();
		qs.addQna(qaVO);
		
		return "redirect:qna_list.do"; //�߰��� 1��1���ǰ� mypage_myQuestion���� ������ ��
	} // qnaAddForm()
	
	
} // class
