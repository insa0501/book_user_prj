package kr.co.sist.user.pagination;

public class TotalCntVO {
	private String book, type; //파라메터에 주는 그거랑 이름이 같으면 또다시 컨트롤러에서 수정해주지 않아도 괜찮으므로
	private String bookCate, bookCateDetail, searchKeyword;
	private String user_id, startDay, endDay;
	private int book_price1, book_price2;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

}
