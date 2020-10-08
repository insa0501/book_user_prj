package kr.co.sist.user.mypage.domain;

import java.util.List;

public class OrderDetailDomain {

	  private String order_name, order_status, order_zipcode, order_addr1, order_addr2,
	          order_phone, card_company, card_no;
	  private int order_price, card_exp_date;
	  private  List<OrderBookListDomain> orderBookList;
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getOrder_zipcode() {
		return order_zipcode;
	}
	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}
	public String getOrder_addr1() {
		return order_addr1;
	}
	public void setOrder_addr1(String order_addr1) {
		this.order_addr1 = order_addr1;
	}
	public String getOrder_addr2() {
		return order_addr2;
	}
	public void setOrder_addr2(String order_addr2) {
		this.order_addr2 = order_addr2;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getCard_company() {
		return card_company;
	}
	public void setCard_company(String card_company) {
		this.card_company = card_company;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getCard_exp_date() {
		return card_exp_date;
	}
	public void setCard_exp_date(int card_exp_date) {
		this.card_exp_date = card_exp_date;
	}
	public List<OrderBookListDomain> getOrderBookList() {
		return orderBookList;
	}
	public void setOrderBookList(List<OrderBookListDomain> orderBookList) {
		this.orderBookList = orderBookList;
	}
	 
	   
	 
	   
}
