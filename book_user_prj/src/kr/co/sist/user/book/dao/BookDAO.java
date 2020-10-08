package kr.co.sist.user.book.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.user.common.domain.BookDomain;
import kr.co.sist.user.GetMyBatisHandler;
import kr.co.sist.user.book.domain.DetailDomain;
import kr.co.sist.user.book.vo.BookCountryVO;
import kr.co.sist.user.book.vo.SearchBookVO;

public class BookDAO {
	
	private static BookDAO bDAO;
	
	private BookDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static BookDAO getInstance() {
		if(bDAO == null) {
			bDAO = new BookDAO();
		}//end if
		
		return bDAO;
	}//getInstance
	
	
	

	/**
	 * '국내', '해외' 책을 select해서 목록으로 보여줌
	 * @param bcVO
	 * @return
	 */
	public List<BookDomain> bookList(BookCountryVO bcVO) {
		List<BookDomain> bookList = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		bookList = ss.selectList("bookCountry", bcVO);
		ss.close();
		
		return bookList; 
	}
	
	/**
	 * 베스트셀러
	 * @param bcVO 
	 * @return
	 */
	public List<BookDomain> bookBestList(BookCountryVO bcVO) {
		List<BookDomain> bookList = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
//		System.out.println("book >>>>>>>>>" + bcVO);
		bookList = ss.selectList("bookBest", bcVO);
		ss.close();
		
		return bookList;
	}
	
	/**
	 * 신간도서
	 * @param bcVO
	 * @return
	 */
	public List<BookDomain> bookNewList(BookCountryVO bcVO) {
		List<BookDomain> bookList = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		bookList = ss.selectList("bookNew", bcVO);
		ss.close();
		
		return bookList;
	}
	
	public List<BookDomain> selectSearchBook(SearchBookVO sbVO) {
		List<BookDomain> bookList = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		bookList = ss.selectList("book_search", sbVO); //mapper의 id
		
		ss.close();
	
		return bookList;
	}
	
	public DetailDomain selectDetailBook(String book_isbn) {
		DetailDomain bookDetailDomain = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		bookDetailDomain = ss.selectOne("book_detail",book_isbn); //mapper id
		
		ss.close();
		
		return bookDetailDomain;
		
	}
	
	public static void main(String[] args) {
		SearchBookVO sbVO = new SearchBookVO();
		 
		 
		sbVO.setBookCateDetail("5");
		System.out.println(BookDAO.getInstance().selectSearchBook(sbVO));
	}
	
	
	
}
