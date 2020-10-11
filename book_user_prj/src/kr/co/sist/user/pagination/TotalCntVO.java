package kr.co.sist.user.pagination;

public class TotalCntVO {
	private String book, type; //파라메터에 주는 그거랑 이름이 같으면 또다시 컨트롤러에서 수정해주지 않아도 괜찮으므로

	public TotalCntVO() {
		super();
	}

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
}
