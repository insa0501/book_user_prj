package kr.co.sist.user.mypage.service;

import java.util.List;

import kr.co.sist.user.mypage.domain.OrderListDomain;
import kr.co.sist.user.mypage.domain.UserInfoDomain;
import kr.co.sist.user.mypage.vo.OrderListVO;
import kr.co.sist.user.mypage.vo.UserInfoVO;
import kr.co.sist.user.mypage.vo.UserResignVO;

public class MypageService {
	
	/** 주문내역조회
	 * @param olVO
	 * @return List<OrderListDomain>
	 */
	public List<OrderListDomain> searchOrderList(OrderListVO olVO) {
		List<OrderListDomain> list = null;
		
		return list;
	} // searchOrderList
	
	/**
	 * 주문취소
	 * @param order_no
	 * @return
	 */
	public int removeOrder(int order_no) {
		int cnt = 0;
		
		return cnt;
	} // removeOrder
	
	/**
	 * 비밀번호 재확인
	 * @param user_pass
	 * @return
	 */
	// id도 받아야하지 않나 생각중. => VO
	public UserInfoDomain checkUserPass(String user_pass) {
		UserInfoDomain uid = null;
		
		return uid;
	} // checkUserPass
	
	/**
	 * 개인정보수정
	 * @param uiVO
	 * @return
	 */
	public int changeUserInfo(UserInfoVO uiVO) {
		int cnt = 0;
		
		return cnt;
	} // changeUserInfo
	
	/**
	 * 회원탈퇴 처리
	 * @param urVO
	 * @return
	 */
	public int userResign(UserResignVO urVO) {
		int cnt = 0;
		
		return cnt;
	} // userResign
} // class