package kr.co.sist.user.order.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.sist.user.order.service.CartService;
import kr.co.sist.user.order.service.OrderService;
import kr.co.sist.user.order.vo.OrderVO;

@SessionAttributes({"cart_list","id"})
@Controller
public class OrderController {
	
	
	@GetMapping(value = "/payment.do")
	public String order(HttpServletRequest request, Model model) {
		//로그인이 되있을 경우에만 결제로 넘어가야함
		//String user_id = request.getParameter("id");
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		System.out.println(user_id +" <================세션에서 가져온 아이디");
		OrderService os = new OrderService();
		
//		model.addAttribute("userInfo", os.orderUserInfo((String)session.getAttribute("user_id")));
		
		String url = "";
		if("".equals(user_id) || user_id == null) {
			url = "redirect:login_form.do?paymentFlag=true";
		}else {
			model.addAttribute("user_info",os.orderUserInfo(user_id));
			url = "payment/user_book_payment";
		}
		
		
		return url;
	}
	
	@PostMapping(value = "/order_done.do")
	public String orderDone(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		OrderService os = new OrderService();
		model.addAttribute("order_no",os.searchOrderNo(user_id));
		
		return "payment/user_book_pay_done";
	}
	
	@PostMapping(value = "/order.do")
	public String orderProcess(HttpServletRequest request, OrderVO orVO, Model model,String cartFlag) {
		//String user_id = request.getParameter("id");
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		String user_ip = request.getRemoteAddr();
		
		orVO.setUser_id(user_id);
		orVO.setUser_ip(user_ip);
		
		String url = null;
		
		try {
			OrderService os = new OrderService();
			os.addOrder(orVO,session,cartFlag);
			// 결재에 성공했을 경우 장바구니에서 물건 삭제
			url = "forward:order_done.do";
		} catch (SQLException e) {
			url = "err/errPage";
			e.printStackTrace();
		}
		
		return url;
	}

	
}
