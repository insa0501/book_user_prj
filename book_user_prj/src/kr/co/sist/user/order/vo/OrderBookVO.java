package kr.co.sist.user.order.vo;

/**
 * DAO에서 사용
 * 주문할 책
 * @author sist33
 *
 */
public class OrderBookVO {
	private String order_no, book_isbn, order_book_cnt;

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getOrder_book_cnt() {
		return order_book_cnt;
	}

	public void setOrder_book_cnt(String order_book_cnt) {
		this.order_book_cnt = order_book_cnt;
	}
	
	
}
