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
		//�α����� ������ ��쿡�� ������ �Ѿ����
		//*********�α��� ���θ� Ȯ���ϰ� �Ѿ����*******2020-10-01 ���� ���� ������
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
		//���߿� ���̵� �޾Ƽ� �������� ���̺� �� �� �ְ� ���־����
		
		
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
		
		// orderProcess �޼ҵ忡�� orderDone �޼ҵ�� ������ �����Ϸ��� ��� �ؾߵ���...
		OrderService os = new OrderService();
		String order_flag = "false";
		if(os.addOrder(orVO)) {
			order_flag = "true";
		}
		model.addAttribute("order_flag",order_flag);
		
		return "forward:order_done.do";
	}
	
}
