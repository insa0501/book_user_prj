package kr.co.sist.user.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.user.GetMyBatisHandler;
import kr.co.sist.user.qna.domain.QnaDomain;
import kr.co.sist.user.qna.vo.QnaAddVO;
import kr.co.sist.user.qna.vo.SelectQnaVO;

public class QnaDAO {
	
	private static QnaDAO qDAO;
	
	private QnaDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static QnaDAO getInstance() {
		if(qDAO == null) {
			qDAO = new QnaDAO();
		}//end if
		return qDAO;
	}//getInstance
	
	/**
	 * 1대1 문의 조회
	 * @param sqVO
	 * @return
	 */
	public List<QnaDomain> selectQnaList(SelectQnaVO sqVO) {
		List<QnaDomain> list = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		list =  ss.selectList("qna_select",sqVO);
	 
		ss.close();
		
		return list;
	} // selectQnaList
	public int selectQnaListCnt(String id) {
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		cnt =  ss.selectOne("qna_select_cnt",id);
		
		ss.close();
		
		return cnt;
	} // selectQnaList
	
	/**
	 * 1대1 문의 추가
	 * @param qaVO
	 */
	public void insertQna(QnaAddVO qaVO) {
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		ss.insert("qna_insert",qaVO); //mapper 아이디
		
		ss.commit();
		ss.close();
		
	} // insertQna
	
/*	public static void main(String[] args) {
		SelectQnaVO sqVO = new SelectQnaVO();
		 
	 	System.out.println("user_id 찍어봄 ----> "+sqVO.getId());
	}*/
	
	
	 
	
} // class