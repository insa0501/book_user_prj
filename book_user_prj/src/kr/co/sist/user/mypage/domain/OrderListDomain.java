package kr.co.sist.user.mypage.domain;

import java.util.List;

/**
 * 주문내역
 * @author sist32
 *
 */
public class OrderListDomain {
	
	private String order_date, order_status, order_price;
	private int order_no; 
	private List<OrderListBookDomain> list;
   
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_price() {
		return order_price;
	}
	public void setOrder_price(String order_price) {
		this.order_price = order_price;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public List<OrderListBookDomain> getList() {
		return list;
	}
	public void setList(List<OrderListBookDomain> list) {
		this.list = list;
	}

	   
} // class
