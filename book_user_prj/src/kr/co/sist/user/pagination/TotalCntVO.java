package kr.co.sist.user.pagination;

public class TotalCntVO {
	private String book, type; //�Ķ���Ϳ� �ִ� �װŶ� �̸��� ������ �Ǵٽ� ��Ʈ�ѷ����� ���������� �ʾƵ� �������Ƿ�
	private String bookCate, bookCateDetail, searchKeyword;
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


}
