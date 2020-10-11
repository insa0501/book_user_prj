package kr.co.sist.user.pagination;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.user.GetMyBatisHandler;

public class PaginationDAO {
	private static PaginationDAO pDAO;
	
	private PaginationDAO() {
		
	}
	
	public static PaginationDAO getInstance() {
		if(pDAO == null) {
			pDAO = new PaginationDAO();
		}
		return pDAO;
	}
	
	
	/**
	 * 국내, 국외 도서에서 사용하는 토탈카운트
	 * @param tcVO
	 * @return
	 */
	public int selectTotalCnt(TotalCntVO tcVO) {
		int cnt = 0;
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		cnt = ss.selectOne("selectTotalCnt", tcVO);
		return cnt;
	}
	
	
	/**
	 * 마이페이지 QNA에서 사용하는 토탈카운트
	 * @param tcVO
	 * @return
	 */
	public int selectTotalCntQna(TotalCntVO tcVO) {
		int cnt = 0;
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		cnt = ss.selectOne("selectTotalCntQna", tcVO);
		return cnt;
	}
	
	

	
	public static void main(String args[]) {
		TotalCntVO tcVO = new TotalCntVO();
//		tcVO.setBook("kor");
		//tcVO.setType("science");
		
		System.out.println(PaginationDAO.getInstance().selectTotalCnt(tcVO));
	}
	
}
