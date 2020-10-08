package kr.co.sist.user.mypage.dao;

import java.util.List;

import kr.co.sist.user.mypage.domain.OrderListDomain;
import kr.co.sist.user.mypage.domain.UserInfoDomain;
import kr.co.sist.user.mypage.vo.UserInfoVO;
import kr.co.sist.user.mypage.vo.UserResignVO;

public class MypageDAO {
	
	/**
	 * 주문내역 조회
	 * @return
	 */
	public List<OrderListDomain> selectOrderList() {
		List<OrderListDomain> list = null;
		
		return list;
	} // selectOrderList()
	
	/**
	 * 주문 삭제
	 * @param order_no
	 * @return
	 */
	public int deleteOrder(int order_no) {
		int cnt = 0;
		
		return cnt;
	} // deleteOrder
	
	/**
	 * 비밀번호 재확인
	 * @param user_pass
	 * @return
	 */
	// id도 받아야 하지 않나 생각중. => VO
	public UserInfoDomain selectUserPass(String user_pass) {
		UserInfoDomain uid = null;
		
		return uid;
	} // selectUserPass
	
	/**
	 * 개인정보 변경
	 * @param uiVO
	 * @return
	 */
	public int updateUserInfo(UserInfoVO uiVO) {
		int cnt = 0;
		
		return cnt;
	} // updateUserInfo
	
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