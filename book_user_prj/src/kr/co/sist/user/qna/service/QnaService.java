package kr.co.sist.user.qna.service;

import java.util.List;

import kr.co.sist.user.qna.dao.QnaDAO;
import kr.co.sist.user.qna.domain.QnaDomain;
import kr.co.sist.user.qna.vo.QnaAddVO;
import kr.co.sist.user.qna.vo.SelectQnaVO;

public class QnaService {
	/**
	 * 1대1 문의 내역조회
	 * @param sqVO
	 * @return
	 */
	public List<QnaDomain> searchQnaList(SelectQnaVO sqVO) {
		List<QnaDomain> list = null;
		
		QnaDAO qDAO = QnaDAO.getInstance();
		list = qDAO.selectQnaList(sqVO);
				
		return list;
	} // searchQnaList
	
	/**
	 * 1대1 문의 추가
	 * @param qaVO
	 */
	public void addQna(QnaAddVO qaVO) {
		
		QnaDAO qDAO = QnaDAO.getInstance();
		qDAO.insertQna(qaVO);
		
	} // addQna
	
	
} // class