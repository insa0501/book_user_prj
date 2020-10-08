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
	 * �ֹ����� �� ���� ���ϱ�
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
	 * �ֹ� ����Ʈ �� å�̸� ���� ������ ��ȸ
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
	 * �ֹ� ����Ʈ �� å�̸� ��ȸ
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
	 * �ֹ� �� ��ȸ �� �ֹ� �� ���� ���� ��ȸ
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
	 * �ֹ� �� ��ȸ �� ���� ���� ��ȸ
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
	 * �ֹ� ����
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
	 * ��й�ȣ ��Ȯ��
	 * @param user_pass
	 * @return
	 */
	// id�� �޾ƾ� ���� �ʳ� ������. => VO
	public UserInfoDomain selectUserPass(UserCheckVO ucVO) {
		UserInfoDomain uid = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		uid = ss.selectOne("selectPass",ucVO);
		ss.close();
		
		return uid;
	} // selectUserPass
	
	/**
	 * �������� ����
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
//		uiVO.setUser_addr1("��õ��");
//		uiVO.setUser_addr2("����");
//		uiVO.setUser_id("test1");
//		uiVO.setUser_pass("1234");
//		uiVO.setUser_phone("01012341234");
//		uiVO.setUser_zipcode("12345");
//		System.out.println(MypageDAO.getInstance().updateUserInfo(uiVO));
	}
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