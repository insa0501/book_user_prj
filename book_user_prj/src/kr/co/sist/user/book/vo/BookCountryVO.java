package kr.co.sist.user.book.vo;

/**
 * 책 분류 : 국내,해외
 * 
 * @author sist31
 *
 */
public class BookCountryVO {
	private String book, type, book_type_no;
	private int start_num, end_num;
	
	
	
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBook_type_no() {
		return book_type_no;
	}
	public void setBook_type_no(String book_type_no) {
		this.book_type_no = book_type_no;
	}
	public int getStart_num() {
		return start_num;
	}
	public void setStart_num(int start_num) {
		this.start_num = start_num;
	}
	public int getEnd_num() {
		return end_num;
	}
	public void setEnd_num(int end_num) {
		this.end_num = end_num;
	}
	
}
