package kr.co.sist.user.book.vo;

/**
 * 책 분류 : 국내,해외
 * 
 * @author sist31
 *
 */
public class BookCountryVO {
	private String book, type, book_type_no;

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

	@Override
	public String toString() {
		return "BookCountryVO [book=" + book + ", type=" + type + ", book_type_no=" + book_type_no + "]";
	}

	
	

//	private String country, book_type_no, type;
//
//	public String getCountry() {
//		return country;
//	}
//
//	public void setCountry(String country) {
//		this.country = country;
//	}
//
//	public String getBook_type_no() {
//		return book_type_no;
//	}
//
//	public void setBook_type_no(String book_type_no) {
//		this.book_type_no = book_type_no;
//	}
//
//	public String getType() {
//		return type;
//	}
//
//	public void setType(String type) {
//		this.type = type;
//	}
}
