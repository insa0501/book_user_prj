package kr.co.sist.user.mypage.domain;

/**
 * 주문상세에서 주문한 책 부분
 * @author sist32
 *
 */
public class OrderBookListDomain {
   private String book_name, book_price, total_price;
   private int order_book_cnt;
   
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_price() {
		return book_price;
	}
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	public int getOrder_book_cnt() {
		return order_book_cnt;
	}
	public void setOrder_book_cnt(int order_book_cnt) {
		this.order_book_cnt = order_book_cnt;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	
}
