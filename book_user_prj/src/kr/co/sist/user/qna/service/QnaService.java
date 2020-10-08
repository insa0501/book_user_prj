package kr.co.sist.user.qna.service;

import java.util.List;

import kr.co.sist.user.qna.dao.QnaDAO;
import kr.co.sist.user.qna.domain.QnaDomain;
import kr.co.sist.user.qna.vo.QnaAddVO;
import kr.co.sist.user.qna.vo.SelectQnaVO;

public class QnaService {
	/**
	 * 1��1 ���� ������ȸ
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
	 * 1��1 ���� �߰�
	 * @param qaVO
	 */
	public void addQna(QnaAddVO qaVO) {
		
		QnaDAO qDAO = QnaDAO.getInstance();
		qDAO.insertQna(qaVO);
		
	} // addQna
	
	
} // class