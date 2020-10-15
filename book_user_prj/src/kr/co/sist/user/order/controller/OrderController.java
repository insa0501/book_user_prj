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
	
	
	/**
	 * ��ٱ��Ͽ��� ���ŷ� �Ѿ ��
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/payment.do")
	public String payment(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		String url = "";
		if("".equals(user_id) || user_id == null) {
			url = "redirect:login_form.do?paymentFlag=true";
		}else {
			OrderService os = new OrderService();
			model.addAttribute("user_info",os.orderUserInfo(user_id));
			url = "payment/user_book_payment";
		}
		return url;
	}
	
	/**
	 * ������ �Է��ϰ� �����ϱ⸦ ������ ��
	 * @param request
	 * @param orVO
	 * @param model
	 * @param cartFlag
	 * @return
	 */
	@PostMapping(value = "/order.do")
	public String orderProcess(HttpServletRequest request, OrderVO orVO, Model model,String cartFlag) {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		String user_ip = request.getRemoteAddr();
		
		orVO.setUser_id(user_id);
		orVO.setUser_ip(user_ip);
		
		String url = null;
		
		try {
			OrderService os = new OrderService();
			os.addOrder(orVO,session,cartFlag);
			// ���翡 �������� ��� ��ٱ��Ͽ��� ���� ����
			url = "forward:order_done.do";
		} catch (SQLException e) {
			url = "err/errPage";
			e.printStackTrace();
		}
		
		return url;
	}

	/**
	 * ���簡 �Ϸ�� �� ����� �����ִ� �޼ҵ�
	 * @param request
	 * @param model
	 * @return
	 */
	@PostMapping(value = "/order_done.do")
	public String orderDone(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		OrderService os = new OrderService();
		model.addAttribute("order_no",os.searchOrderNo(user_id));
		
		return "payment/user_book_pay_done";
	}
	

	
}
