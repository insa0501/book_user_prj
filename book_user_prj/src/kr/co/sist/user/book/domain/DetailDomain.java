package kr.co.sist.user.book.domain;

/**
 * 도서상세 조회할 컬럼
 * @author sist32
 *
 */
public class DetailDomain {

	private String book_isbn, book_name, book_company, book_writer, book_country, book_img, 
	        book_date, book_input_date, book_info,book_type_no;
	private int book_price, book_stock, order_book_cnt;
	
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
	public String getBook_company() {
		return book_company;
	}
	public void setBook_company(String book_company) {
		this.book_company = book_company;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public String getBook_country() {
		return book_country;
	}
	public void setBook_country(String book_country) {
		this.book_country = book_country;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public String getBook_input_date() {
		return book_input_date;
	}
	public void setBook_input_date(String book_input_date) {
		this.book_input_date = book_input_date;
	}
	public String getBook_info() {
		return book_info;
	}
	public void setBook_info(String book_info) {
		this.book_info = book_info;
	}
	public String getBook_type_no() {
		return book_type_no;
	}
	public void setBook_type_no(String book_type_no) {
		this.book_type_no = book_type_no;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public int getBook_stock() {
		return book_stock;
	}
	public void setBook_stock(int book_stock) {
		this.book_stock = book_stock;
	}
	public int getOrder_book_cnt() {
		return order_book_cnt;
	}
	public void setOrder_book_cnt(int order_book_cnt) {
		this.order_book_cnt = order_book_cnt;
	}
	
	
	 
	
}
