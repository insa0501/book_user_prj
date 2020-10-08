package kr.co.sist.user.mypage.vo;

public class PageNationVO {
	String url, term;
	int currentPage, totalPage;
	
	public PageNationVO() {
	}

	public PageNationVO(String url, String term, int currentPage, int totalPage) {
		super();
		this.url = url;
		this.term = term;
		this.currentPage = currentPage;
		this.totalPage = totalPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
