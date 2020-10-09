package kr.co.sist.user.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.sist.user.order.service.OrderService;
import kr.co.sist.user.order.vo.OrderBookVO;
import kr.co.sist.user.order.vo.OrderVO;

@SessionAttributes({"cart_list","user_id"})
@Controller
public class OrderController {
	
	
	@GetMapping(value = "/payment.do")
	public String order(HttpServletRequest request, Model model) {
		//로그인이 되있을 경우에만 결제로 넘어가야함
		//*********로그인 여부를 확인하고 넘어가야함*******2020-10-01 아직 구현 안했음
		String user_id = request.getParameter("user_id");
		
		OrderService os = new OrderService();
		
//		model.addAttribute("userInfo", os.orderUserInfo((String)session.getAttribute("user_id")));
		//model.addAttribute("user_info",os.orderUserInfo(user_id));
		model.addAttribute("user_info", os.orderUserInfo("test1"));
		
		return "payment/user_book_payment";
	}
	
	@GetMapping(value = "/order_done.do")
	public String orderDone(HttpServletRequest request, OrderVO orVO, Model model) {
		String user_id = request.getParameter("user_id");
		//나중에 아이디를 받아서 결제정보 테이블에 들어갈 수 있게 해주어야함
		
		
		OrderService os = new OrderService();
		model.addAttribute("order_no",os.searchOrderNo("test1"));
		
		return "payment/user_book_pay_done";
	}
	
	@GetMapping(value = "/order.do")
	public String orderProcess(HttpServletRequest request, OrderVO orVO, Model model) {
		String user_id = request.getParameter("user_id");
		String user_ip = request.getRemoteAddr();
		
		orVO.setUser_id(user_id);
		orVO.setUser_id("test1");
		orVO.setUser_ip(user_ip);
		
		// orderProcess 메소드에서 orderDone 메소드로 변수를 전달하려면 어떻게 해야되지...
		OrderService os = new OrderService();
		String order_flag = "false";
		if(os.addOrder(orVO)) {
			order_flag = "true";
		}
		model.addAttribute("order_flag",order_flag);
		
		return "forward:order_done.do";
	}
	
}
