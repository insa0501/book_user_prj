package kr.co.sist.user.mypage.service;

import java.util.List;

import kr.co.sist.user.mypage.domain.OrderListDomain;
import kr.co.sist.user.mypage.domain.UserInfoDomain;
import kr.co.sist.user.mypage.vo.OrderListVO;
import kr.co.sist.user.mypage.vo.UserInfoVO;
import kr.co.sist.user.mypage.vo.UserResignVO;

public class MypageService {
	
	/** �ֹ�������ȸ
	 * @param olVO
	 * @return List<OrderListDomain>
	 */
	public List<OrderListDomain> searchOrderList(OrderListVO olVO) {
		List<OrderListDomain> list = null;
		
		return list;
	} // searchOrderList
	
	/**
	 * �ֹ����
	 * @param order_no
	 * @return
	 */
	public int removeOrder(int order_no) {
		int cnt = 0;
		
		return cnt;
	} // removeOrder
	
	/**
	 * ��й�ȣ ��Ȯ��
	 * @param user_pass
	 * @return
	 */
	// id�� �޾ƾ����� �ʳ� ������. => VO
	public UserInfoDomain checkUserPass(String user_pass) {
		UserInfoDomain uid = null;
		
		return uid;
	} // checkUserPass
	
	/**
	 * ������������
	 * @param uiVO
	 * @return
	 */
	public int changeUserInfo(UserInfoVO uiVO) {
		int cnt = 0;
		
		return cnt;
	} // changeUserInfo
	
	/**
	 * ȸ��Ż�� ó��
	 * @param urVO
	 * @return
	 */
	public int userResign(UserResignVO urVO) {
		int cnt = 0;
		
		return cnt;
	} // userResign
} // class