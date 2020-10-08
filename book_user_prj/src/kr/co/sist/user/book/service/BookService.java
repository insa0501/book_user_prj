package kr.co.sist.user.book.service;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.user.common.domain.BookDomain;
import kr.co.sist.user.book.dao.BookDAO;
import kr.co.sist.user.book.domain.DetailDomain;
import kr.co.sist.user.book.vo.BookCountryVO;
import kr.co.sist.user.book.vo.SearchBookVO;


public class BookService {
    

	/**
	 * '����', '�ؿ�' ���� ���
	 * @param bcVO
	 * @return
	 */
	public List<BookDomain> bookList(BookCountryVO bcVO){
		List<BookDomain> bookList = null;
		
		BookDAO bookDAO = BookDAO.getInstance();
		bookList = bookDAO.bookList(bcVO);
		
		return bookList;
	}
	
	/**
	 * ����Ʈ����
	 * @param bcVO 
	 * @param bcVO
	 * @return
	 */
	public List<BookDomain> bookBestList(BookCountryVO bcVO){
		List<BookDomain> bookList = null;
		
		BookDAO bookDAO = BookDAO.getInstance();
		bookList = bookDAO.bookBestList(bcVO);
		
		return bookList;
	}
	
	
	/**
	 * �Ű� �������
	 * @param bcVO
	 * @return
	 */
	public List<BookDomain> bookNewList(BookCountryVO bcVO){
		List<BookDomain> bookList = null;
		
		BookDAO bookDAO = BookDAO.getInstance();
		bookList = bookDAO.bookNewList(bcVO);
		
		return bookList;
	}
	
	
	
	public List<BookDomain> selectSearchBook(SearchBookVO sbVO){
		 List<BookDomain> bookList = null;
		
		 BookDAO bDAO = BookDAO.getInstance();
		 bookList = bDAO.selectSearchBook(sbVO);
		 
		 return bookList;
		
	}//searchBook
	
	public DetailDomain detailBook(String book_isbn){
		DetailDomain bookDetailDomain = null;
		
		BookDAO bDAO = BookDAO.getInstance();
		bookDetailDomain = bDAO.selectDetailBook(book_isbn);
		
		return bookDetailDomain;
		
	}
	
	
	
	
}
