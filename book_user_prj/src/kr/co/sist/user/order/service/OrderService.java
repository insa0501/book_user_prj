package kr.co.sist.user.order.service;

import kr.co.sist.user.order.dao.OrderDAO;
import kr.co.sist.user.order.domain.OrderUserInfoDomain;
import kr.co.sist.user.order.vo.OrderVO;

public class OrderService {

	public OrderUserInfoDomain orderUserInfo(String user_id){
		OrderUserInfoDomain ouiDomain = null;
		
		OrderDAO oDAO = OrderDAO.getInstance();
		ouiDomain = oDAO.SelectOrderUserInfo(user_id);
		
		return ouiDomain;
		
	}//orderUserInfo

	
	public boolean addOrder(OrderVO orVO){
		boolean addResult = false;
		
		OrderDAO oDAO = OrderDAO.getInstance();
		addResult = oDAO.InsertOrder(orVO) > 0 ? true : false;
		
		return addResult;
	}//addOrder
	
	public String searchOrderNo() {
		String orderNo = "";
		
		OrderDAO oDAO = OrderDAO.getInstance();
		
		orderNo = oDAO.selectOrderNo();
		
		return orderNo;
	}
	
	
}//class
