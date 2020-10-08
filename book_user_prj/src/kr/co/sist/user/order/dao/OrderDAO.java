package kr.co.sist.user.order.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.user.GetMyBatisHandler;
import kr.co.sist.user.order.domain.OrderUserInfoDomain;
import kr.co.sist.user.order.vo.OrderBookVO;
import kr.co.sist.user.order.vo.OrderVO;

public class OrderDAO {
	private static OrderDAO oDAO;
	
	private OrderDAO() {		
	}

	public static OrderDAO getInstance() {
		if(oDAO == null) {
			oDAO = new OrderDAO();
		}//end if
		return oDAO;
	}//getInstance
	
   public OrderUserInfoDomain SelectOrderUserInfo(String user_id){
	   OrderUserInfoDomain ouiDomain = null;
	   
	   SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
	   ouiDomain = ss.selectOne("selectUserInfo",user_id);
	   
	   ss.close();
	   return ouiDomain;
	   
   }//SelectOrderUserInfo
	
   public int InsertOrder(OrderVO orVO){
	   int insertResult = 0;
	   
	   SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
	   
	   String orderNo = ss.selectOne("selectNextVal");
	   
	   orVO.setOrder_no(orderNo);
	   
	   ss.insert("insertOrderList", orVO);

	   OrderBookVO obVO = new OrderBookVO();
	   obVO.setOrder_no(orderNo);
	   
	   String[] bookIsbnArr = orVO.getBook_isbn();
	   String[] orderBookCntArr = orVO.getOrder_book_cnt();
	   
	   for(int ind=0; ind<bookIsbnArr.length; ind++) {
		   obVO.setBook_isbn(bookIsbnArr[ind]);
		   obVO.setOrder_book_cnt(orderBookCntArr[ind]);
		   ss.insert("insertOrderBook", obVO);   
	   }

	   ss.insert("insertPayment", orVO);
	   
	   ss.commit();
	   return insertResult;
	   
   }
   
   public String selectOrderNo() {
	   String orderNo = "";
	   
	   SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
	   orderNo = ss.selectOne("selectOrderNo");
	   
	   return orderNo;
   }
   
}
