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
		int result = oDAO.InsertOrder(orVO);
		addResult = result > 0 ? true : false;
		
		return addResult;
	}//addOrder
	
	public String searchOrderNo(String user_id) {
		String orderNo = "";
		
		OrderDAO oDAO = OrderDAO.getInstance();
		
		orderNo = oDAO.selectOrderNo(user_id);
		System.out.println(user_id+"====================== user_id");
		System.out.println(orderNo+"====================== orderNo");
		
		return orderNo;
	}
	
	
}//class
