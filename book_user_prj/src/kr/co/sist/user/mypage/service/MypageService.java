package kr.co.sist.user.mypage.service;

import java.util.ArrayList;
import java.util.List;

import kr.co.sist.user.mypage.dao.MypageDAO;
import kr.co.sist.user.mypage.domain.OrderBookListDomain;
import kr.co.sist.user.mypage.domain.OrderDetailDomain;
import kr.co.sist.user.mypage.domain.OrderListBookDomain;
import kr.co.sist.user.mypage.domain.OrderListDomain;
import kr.co.sist.user.mypage.domain.UserInfoDomain;
import kr.co.sist.user.mypage.vo.SelectOrderListVO;
import kr.co.sist.user.mypage.vo.UserCheckVO;
import kr.co.sist.user.mypage.vo.UserInfoVO;
import kr.co.sist.user.mypage.vo.UserResignDataVO;
import kr.co.sist.user.mypage.vo.UserResignVO;

public class MypageService {
	
	/** �ֹ� ����Ʈ ��ȸ
	 * @param olVO
	 * @return List<OrderListDomain>
	 */
	public List<OrderListDomain> searchOrderList(SelectOrderListVO solVO) {
		List<OrderListDomain> list = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		list = mDAO.selectOrderList(solVO);
		List<OrderListBookDomain> bookList = mDAO.selectOrderListBook(solVO);
		
		List<OrderListBookDomain> tempList = null;
		
		for(OrderListDomain l : list) {
			tempList = new ArrayList<OrderListBookDomain>();
			for(OrderListBookDomain l2 : bookList) {
				if(l.getOrder_no() == l2.getOrder_no()) {
					tempList.add(l2);
				}//end if
			}//end for
			l.setList(tempList);
		}//end for
		
		return list;
	} // searchOrderList
	
	/**
	 * �ֹ� �� ���� ��ȸ
	 * @param order_no
	 * @return
	 */
	public OrderDetailDomain searchOrderDeatil(int order_no) {
		OrderDetailDomain odd = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		odd = mDAO.selectOrderDetail(order_no);
		List<OrderBookListDomain> bookList = mDAO.selectOrderDetailBook(order_no);
		
		odd.setOrderBookList(bookList);
		
		return odd;
	} // searchOrderList
	
	/**
	 * �ֹ����
	 * @param order_no
	 * @return
	 */
	public boolean removeOrder(int order_no) {
		boolean remove_flag = false;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		remove_flag = mDAO.deleteOrder(order_no)==1;
		
		return remove_flag;
	} // removeOrder
	
	/**
	 * ��й�ȣ ��Ȯ��
	 * @param user_pass
	 * @return
	 */
	// id�� �޾ƾ����� �ʳ� ������. => VO
	public UserInfoDomain checkUserPass(UserCheckVO ucVO) {
		UserInfoDomain uid = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		uid = mDAO.selectUserPass(ucVO);
		
		return uid;
	} // checkUserPass
	
	/**
	 * ������������
	 * @param uiVO
	 * @return
	 */
	public boolean changeUserInfo(UserInfoVO uiVO) {
		boolean update_flag = false;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		update_flag = mDAO.updateUserInfo(uiVO) > 0;
		
		return update_flag;
	} // changeUserInfo
	
	/**
	 * ȸ��Ż�� ó��
	 * @param urVO
	 * @return
	 */
	public boolean userResign(UserResignVO urVO) {
		boolean flag = false;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		
		String chk_id = mDAO.selectResignId(urVO);
		
		if(!"".equals(chk_id) && chk_id != null) {
			flag = mDAO.updateUserResign(urVO) != 0;
		}//end if
		
		if(flag) {
			UserResignDataVO urdVO = null;
			for(String resdata : urVO.getUser_resdata()) {
				urdVO = new UserResignDataVO();
				urdVO.setUser_id(urVO.getUser_id());
				urdVO.setUser_resdata(resdata);
				mDAO.insertResdata(urdVO);
			}//end for
		}//end if
		
		return flag;
	} // userResign
	
} // class