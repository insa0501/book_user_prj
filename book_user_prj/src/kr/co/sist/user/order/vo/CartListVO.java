package kr.co.sist.user.order.vo;

/**
 * ��ٱ���
 * @author sist32
 *
 */
public class CartListVO { 

	private String book_isbn, book_name;
	private int book_price, order_book_cnt;
	
	
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public int getOrder_book_cnt() {
		return order_book_cnt;
	}
	public void setOrder_book_cnt(int order_book_cnt) {
		this.order_book_cnt = order_book_cnt;
	}
	
	 
	
	 
	
}
