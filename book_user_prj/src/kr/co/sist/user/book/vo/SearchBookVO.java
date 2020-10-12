package kr.co.sist.user.book.vo;

/**
 * 도서검색
 * 
 * @author sist32
 *
 */
public class SearchBookVO {
	private String bookCate, bookCateDetail, searchType, searchKeyword; 
	int  book_price1, book_price2, start_num, end_num;
	
	public String getBookCate() {
		return bookCate;
	}
	public void setBookCate(String bookCate) {
		this.bookCate = bookCate;
	}
	public String getBookCateDetail() {
		return bookCateDetail;
	}
	public void setBookCateDetail(String bookCateDetail) {
		this.bookCateDetail = bookCateDetail;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getBook_price1() {
		return book_price1;
	}
	public void setBook_price1(int book_price1) {
		this.book_price1 = book_price1;
	}
	public int getBook_price2() {
		return book_price2;
	}
	public void setBook_price2(int book_price2) {
		this.book_price2 = book_price2;
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
