package kr.co.sist.user.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.user.GetMyBatisHandler;
import kr.co.sist.user.mypage.domain.OrderBookListDomain;
import kr.co.sist.user.mypage.domain.OrderDetailDomain;
import kr.co.sist.user.mypage.domain.OrderListBookDomain;
import kr.co.sist.user.mypage.domain.OrderListDomain;
import kr.co.sist.user.mypage.domain.UserInfoDomain;
import kr.co.sist.user.mypage.vo.SelectOrderListVO;
import kr.co.sist.user.mypage.vo.UserCheckVO;
import kr.co.sist.user.mypage.vo.UserInfoVO;
import kr.co.sist.user.mypage.vo.UserResignVO;

public class MypageDAO {
	private static MypageDAO mDAO;
	
	private MypageDAO() {
	}
	
	public static MypageDAO getInstance() {
		if(mDAO==null) {
			mDAO = new MypageDAO();
		}//end if
		return mDAO;
	}//getInstance
	
	/**
	 * 주문정보 총 개수 구하기
	 * @param sdVO
	 * @return
	 */
	public int selectOrderCount(SelectOrderListVO solVO) {
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		cnt = ss.selectOne("selectOrderCnt", solVO);
		ss.close();
		
		return cnt;
	}//selectOrderCount
	
	/**
	 * 주문 리스트 중 책이름 말고 나머지 조회
	 * @return
	 */
	public List<OrderListDomain> selectOrderList(SelectOrderListVO solVO) {
		List<OrderListDomain> list = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		list = ss.selectList("selectOrderList", solVO);
		ss.close();
		
		return list;
	} // selectOrderList()
	
	/**
	 * 주문 리스트 중 책이름 조회
	 * @return
	 */
	public List<OrderListBookDomain> selectOrderListBook(SelectOrderListVO solVO) {
		List<OrderListBookDomain> list = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		list = ss.selectList("selectOrderListBook", solVO);
		ss.close();
		
		return list;
	} // selectOrderList()
	
	
	/**
	 * 주문 상세 조회 중 주문 및 결제 정보 조회
	 * @param moVO
	 * @return
	 */
	public OrderDetailDomain selectOrderDetail(int order_no) {
		OrderDetailDomain odd = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		odd = ss.selectOne("selectOrderDetail",order_no);
		ss.close();
		
		return odd;
	}//selectOrderDetail
	
	/**
	 * 주문 상세 조회 중 도서 정보 조회
	 * @param moVO
	 * @return
	 */
	public List<OrderBookListDomain> selectOrderDetailBook(int order_no) {
		List<OrderBookListDomain> list = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		list = ss.selectList("selectOrderDetailBook",order_no);
		ss.close();
		
		return list;
	}//selectOrderDetail
	
	
	/**
	 * 주문 삭제
	 * @param order_no
	 * @return
	 */
	public int deleteOrder(int order_no) {
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		ss.delete("deleteOrderPay",order_no);
		ss.delete("deleteOrderBook",order_no);
		cnt = ss.delete("deleteOrder", order_no);
		ss.commit();
		ss.close();
		
		return cnt;
	} // deleteOrder
	
	
	/**
	 * 비밀번호 재확인
	 * @param user_pass
	 * @return
	 */
	// id도 받아야 하지 않나 생각중. => VO
	public UserInfoDomain selectUserPass(UserCheckVO ucVO) {
		UserInfoDomain uid = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		uid = ss.selectOne("selectPass",ucVO);
		ss.close();
		
		return uid;
	} // selectUserPass
	
	/**
	 * 개인정보 변경
	 * @param uiVO
	 * @return
	 */
	public int updateUserInfo(UserInfoVO uiVO) {
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		cnt = ss.update("updateUserInfo", uiVO);
		ss.commit();
		ss.close();
		
		return cnt;
	} // updateUserInfo
	
	public static void main(String[] args) {
//		UserInfoVO uiVO = new UserInfoVO();
//		uiVO.setUser_addr1("인천시");
//		uiVO.setUser_addr2("부평구");
//		uiVO.setUser_id("test1");
//		uiVO.setUser_pass("1234");
//		uiVO.setUser_phone("01012341234");
//		uiVO.setUser_zipcode("12345");
//		System.out.println(MypageDAO.getInstance().updateUserInfo(uiVO));
	}
	/**
	 * 회원탈퇴 처리
	 * @param urVO
	 * @return
	 */
	public int updateUserResign(UserResignVO urVO) {
		int cnt = 0;
		
		return cnt;
	} // updateUserResign
} // class