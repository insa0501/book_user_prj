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
	
	/**
	 * 검색에서 사용하는 토탈카운트
	 * @param tcVO
	 * @return
	 */
	public int selectTotalCntSearch(TotalCntVO tcVO) {
		int cnt = 0;
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		cnt = ss.selectOne("selectTotalCntSearch", tcVO);
		return cnt;
	}
	
	/**
	 * 마이페이지에서 주문정보에 사용하는 토탈카운트
	 * @param sdVO
	 * @return
	 */
	public int selectTotalCntOrder(TotalCntVO tcVO) {
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		cnt = ss.selectOne("selectTotalCntOrder", tcVO);
		ss.close();
		
		return cnt;
	}//selectOrderCount

	
	public static void main(String args[]) {
		TotalCntVO tcVO = new TotalCntVO();
		tcVO.setUser_id("user1");
		tcVO.setStartDay("2020-05-01");
		tcVO.setEndDay("2020-10-14");
		
		System.out.println(PaginationDAO.getInstance().selectTotalCntOrder(tcVO));
	}
	
}
