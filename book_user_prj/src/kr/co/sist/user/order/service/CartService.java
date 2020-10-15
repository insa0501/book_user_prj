package kr.co.sist.user.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import kr.co.sist.user.order.vo.CartListVO;

public class CartService {
 
   /**
    * 장바구니 세션을 검색
	* @param session
	* @return
	*/
	public List<CartListVO> readCart(HttpSession session){
       Object obj= session.getAttribute("cart_list");
       List<CartListVO> list = new ArrayList<CartListVO>();
      if ( obj != null) {
      HashMap<String, CartListVO> map = (HashMap<String, CartListVO>) obj;
         if( map != null ) {
            Set<String> keySet = map.keySet();
            
            for(String isbn : keySet) {
               list.add(map.get(isbn));
            }//end for
         }//end if
      
      }
      return list;
   }//readCart
   
   /**
    * 장바구니 세션에 추가하는 메소드
    * @param session
	* @param clVO
	*/
   public void addCart(HttpSession session, CartListVO clVO) {
      
      Object obj= session.getAttribute("cart_list");
      if( obj == null ) {
         session.setAttribute("cart_list", new HashMap<String, CartListVO>());
         obj= session.getAttribute("cart_list");
      }
      
      HashMap<String, CartListVO> map = (HashMap<String, CartListVO>) obj;
      
      map.put(clVO.getBook_isbn(), clVO);
      session.setAttribute("cart_list",map);
      
   }
   
   /**
    * book_isbn 배열로 key를 검색해서 해당 정보를 지움
    * @param session
    * @param book_isbn
    */
   public void removeCart(HttpSession session,String[] hidden_book_isbn){
      Object obj= session.getAttribute("cart_list");
      HashMap<String, CartListVO> map = (HashMap<String, CartListVO>) obj;
      
      
      for(String isbn : hidden_book_isbn) {
         map.remove(isbn);
      }
      session.setAttribute("cart_list",map);      
      
   }
   
   
}