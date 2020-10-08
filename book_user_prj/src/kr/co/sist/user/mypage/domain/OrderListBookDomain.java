package kr.co.sist.user.mypage.domain;

public class OrderListBookDomain {
	private String book_name;
	private int order_no, order_book_cnt;
	
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrder_book_cnt() {
		return order_book_cnt;
	}
	public void setOrder_book_cnt(int order_book_cnt) {
		this.order_book_cnt = order_book_cnt;
	}
	
}
