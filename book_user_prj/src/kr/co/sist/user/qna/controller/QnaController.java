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
	public String qnaListPage(HttpSession session, Model model, SelectQnaVO sqVO, @RequestParam(defaultValue = "1") int current_page) {
		
		PaginationService ps = new PaginationService(); //���������̼�
		
		sqVO.setId( (String)session.getAttribute("id"));//session���� user_id ���
		sqVO.setStart_num(ps.startNum(current_page));
		sqVO.setEnd_num(ps.endNum(current_page));

		TotalCntVO tcVO=new TotalCntVO();
		tcVO.setUser_id((String)session.getAttribute("id"));
		System.out.println(tcVO);
		
		PageVO pVO = ps.calcPagingQna(current_page, tcVO);
		QnaService qs = new QnaService();
		int cnt=qs.searchQnaListCnt(sqVO.getId());
		qs.searchQnaList(sqVO);
		
		model.addAttribute("qna_select", qs.searchQnaList(sqVO)); //qna���
		model.addAttribute("totalCnt", cnt); //qna���
		model.addAttribute("pageScale",ps.pageScale() ); //qna���
		model.addAttribute("paging", pVO); //���������̼�
		
		System.out.println("current Page=====================>" + pVO.getCurrent_page());
		System.out.println("start Page=====================>" + pVO.getStart_page());
		System.out.println("end Page=====================>" + pVO.getEnd_page());
		System.out.println("pre Page=====================>" + pVO.getPre_page());
		System.out.println("next Page=====================>" + pVO.getNext_page());
		System.out.println("total Page=====================>" + pVO.getTotal_page());

		
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
