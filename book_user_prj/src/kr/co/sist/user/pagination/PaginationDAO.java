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
	 * ����, ���� �������� ����ϴ� ��Żī��Ʈ
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
	 * ���������� QNA���� ����ϴ� ��Żī��Ʈ
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
