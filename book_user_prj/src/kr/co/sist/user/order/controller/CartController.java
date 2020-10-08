package kr.co.sist.user.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.sist.user.order.service.CartService;
import kr.co.sist.user.order.vo.CartListVO;

@SessionAttributes({"cart_list"})
@Controller
public class CartController {

   @RequestMapping(value = "/get_cart_list.do", method = RequestMethod.GET )
   public String cartList(HttpSession session, Model model) {
      
      CartService cs = new CartService();
      model.addAttribute("cart", cs.readCart(session));
      
      return "cart/user_book_cart";
   }//cartList
   
   
   @RequestMapping(value = "/set_session.do", method = RequestMethod.GET )
   public String addCart(HttpSession session, CartListVO clVO, String redirectFlag) {      

      CartService cs = new CartService();
      
      System.out.println("-------------Å×½ºÆ®-------------");
      System.out.println(clVO.getBook_isbn());
      System.out.println(clVO.getBook_name());
      System.out.println(clVO.getBook_price());
      
      cs.addSession(session, clVO);
      String url="get_cart_list.do";
      if( "false".equals(redirectFlag)){
    	  url="book_detail.do?book_isbn="+clVO.getBook_isbn();
      }//end if
      

      return "redirect:"+url;
   }//addCart
   
   @RequestMapping(value = "/remove_session.do", method = RequestMethod.GET )
   public String removeCart(HttpSession session, String[] hidden_book_isbn) {
      CartService cs = new CartService();
      
      cs.removeCart(session, hidden_book_isbn);
      
      return "redirect:get_cart_list.do";
   }//removeCart
   
   
   
}