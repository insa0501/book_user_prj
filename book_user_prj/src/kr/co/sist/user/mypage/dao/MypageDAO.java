package kr.co.sist.user.mypage.dao;

import java.util.List;

import kr.co.sist.user.mypage.domain.OrderListDomain;
import kr.co.sist.user.mypage.domain.UserInfoDomain;
import kr.co.sist.user.mypage.vo.UserInfoVO;
import kr.co.sist.user.mypage.vo.UserResignVO;

public class MypageDAO {
	
	/**
	 * �ֹ����� ��ȸ
	 * @return
	 */
	public List<OrderListDomain> selectOrderList() {
		List<OrderListDomain> list = null;
		
		return list;
	} // selectOrderList()
	
	/**
	 * �ֹ� ����
	 * @param order_no
	 * @return
	 */
	public int deleteOrder(int order_no) {
		int cnt = 0;
		
		return cnt;
	} // deleteOrder
	
	/**
	 * ��й�ȣ ��Ȯ��
	 * @param user_pass
	 * @return
	 */
	// id�� �޾ƾ� ���� �ʳ� ������. => VO
	public UserInfoDomain selectUserPass(String user_pass) {
		UserInfoDomain uid = null;
		
		return uid;
	} // selectUserPass
	
	/**
	 * �������� ����
	 * @param uiVO
	 * @return
	 */
	public int updateUserInfo(UserInfoVO uiVO) {
		int cnt = 0;
		
		return cnt;
	} // updateUserInfo
	
	/**
	 * ȸ��Ż�� ó��
	 * @param urVO
	 * @return
	 */
	public int updateUserResign(UserResignVO urVO) {
		int cnt = 0;
		
		return cnt;
	} // updateUserResign
} // class