package kr.co.sist.user.mypage.domain;

/**
 * 주문상세에서 주문한 책 부분
 * @author sist32
 *
 */
public class OrderBookListDomain {
   private String book_name;
   private int book_cnt;
   
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getBook_cnt() {
		return book_cnt;
	}
	public void setBook_cnt(int book_cnt) {
		this.book_cnt = book_cnt;
	}
	   
	   
		 
	   
}
