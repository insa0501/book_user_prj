package kr.co.sist.user.book.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.user.book.service.BookService;
import kr.co.sist.user.book.vo.BookCountryVO;
import kr.co.sist.user.book.vo.SearchBookVO;

@Controller
public class BookController {
  
	@RequestMapping(value = "/book.do", method = RequestMethod.GET)
	public String selectBookMain() {
		
		return "book/book_main";
	}
	
	@RequestMapping(value = "/booklist.do", method = RequestMethod.GET)
	public String selectListMain() {
		
		return "book/bookCoun_main";
	}
	
	
	@RequestMapping(value = "/bookbest.do", method = RequestMethod.GET)
	public String selectBestMain() {
		
		return "book/bookBest_main";
	}
	
	@RequestMapping(value = "/booknew.do", method = RequestMethod.GET)
	public String selectNewMain() {
		
		return "book/bookNew_main";
	}
	
	
	/**
	 * 베스트셀러를 보여주는 부분. 임포트 해서 들어감
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/bookList_best.do", method = RequestMethod.GET)
	public String selectBestBook(BookCountryVO bcVO, Model model) {
//		System.out.println("params>>>"  + bcVO);
		BookService bs = new BookService();
		model.addAttribute("book_list_best", bs.bookBestList(bcVO));
		
		return "book/bookList_best";
	}
	
	
	/**
	 * 국내, 해외 도서 목록을 보여주는 부분. 임포트 해서 들어감
	 * @param model
	 * @param bcVO
	 * @return
	 */
	@RequestMapping(value = "/bookList_country.do", method = RequestMethod.GET)
	public String selectKorBook(BookCountryVO bcVO, Model model) {
		
		BookService bs = new BookService();
		model.addAttribute("book_list", bs.bookList(bcVO));
		
		return "book/bookList_coun";
	}
	
	
	@RequestMapping(value = "/bookList_new.do", method = RequestMethod.GET)
	public String newBook(BookCountryVO bcVO, Model model) {
		
		BookService bs = new BookService();
		model.addAttribute("book_list_new", bs.bookNewList(bcVO));
		
		return "book/bookList_new";
	}
	
	
	 
  	@RequestMapping(value = "/book_search_result.do", method = GET)
	  public String bookSearchResult(String bookCate, String bookCateDetail, @RequestParam(defaultValue = "0")String price1, @RequestParam(defaultValue = "0")String price2, String searchType,String searchkeyword, Model model) {//SearchBookVO sbVO를 받으면 price(int 때문에 오류남)
	  
  		SearchBookVO sbVO = new SearchBookVO();
  		
  		if(bookCate != null) {
  			
  			sbVO.setBookCate(bookCate);
  	
  		}
  		if(bookCateDetail != null) {
  			sbVO.setBookCateDetail(bookCateDetail);
  			
  		}
  		if( !"0".equals(price1)) { 
  			sbVO.setBook_price1(Integer.parseInt(price1));
  			
  		}
  		if( !"0".equals(price2)) {
  			sbVO.setBook_price2(Integer.parseInt(price2));
  			
  		}
  		
  			
  		if(searchkeyword != null) {
  			sbVO.setSearchType(searchType);
  			sbVO.setSearchKeyword(searchkeyword);
  			
  		}
  		
  		BookService bs = new BookService();
  	 	model.addAttribute("search_book_result",bs.selectSearchBook(sbVO));
  		
	     return "book_search/user_book_search_frm"; // result.jsp로 따로 빼지않고 우선 frm으로 다시 보냄
	   }
	
  	
	
  	@RequestMapping(value = "/book_detail.do", method = RequestMethod.GET)
  	public String bookDetail(String book_isbn, Model model) {
  		
  		BookService bs = new BookService();
  		model.addAttribute("book_detail",bs.detailBook(book_isbn));
  		
  		return "book_detail/user_book_detail";
  		
  	}
	
	
}

