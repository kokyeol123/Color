package global.sesoc.color.controllers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.color.dao.CustomerDao;
import global.sesoc.color.vo.Customer;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerDao dao;
	
	// 회원가입화면요청
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "customer/joinForm";
	}
	
	// 회원가입 처리 요청
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Customer customer) {
		dao.signup(customer);
		return "redirect:/";
	}
//	
//	// 로그인 화면을 요청
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "customer/loginForm";
//	}
//	
//	// 로그인 처리를 요청
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(Customer customer, boolean rememberMe, HttpServletResponse response, HttpSession session, Model model) {
//		
//		if (rememberMe) {
//			Cookie cookie = new Cookie("savedId", customer.getCustid());
//			response.addCookie(cookie);
//		} else {
//			Cookie cookie = new Cookie("savedId", null);
//			cookie.setMaxAge(0);
//			response.addCookie(cookie);
//		}
//		
//		// DB에서 id와 pwd가 맞는 상둉자가 존재하는지 확인
//		Customer c = dao.selectOne(customer);
//		
//		if (c != null) {
//			session.setAttribute("loginId", c.getCustid());
//			session.setAttribute("custname", c.getCustname());
//			return "redirect:/";
//		} else {
//			model.addAttribute("error", "입력한 정보가 틀렸습니다.");
//			return "customer/loginForm";
//		}
//	}
//	
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		
//		return "index";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="/idCheck", method = RequestMethod.GET)
//	public String idCheck(Customer customer) {
//		Customer c = dao.selectOne(customer);
//		
//		if (c == null) {
//			return "success";
//		}
//		
//		return "fail";
//	}
//	
////	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
////	public String idCheck(Customer customer, Model model) {
////		Customer c = dao.selectOne(customer);
////		// c가 null이 아니라면 그 아이디는 사용불가!
////		
////		if(c != null)
////			model.addAttribute("id", c.getCustid());
////		else
////			model.addAttribute("id", null);
////			model.addAttribute("custid", customer.getCustid());
////		
////		return "customer/idCheck";
////	}
//	
//	@RequestMapping(value="/modify", method = RequestMethod.GET)
//	public String modify(Model model, @RequestParam(value = "result", defaultValue = "-1") int result) {
//		if (result == 0) {
//			model.addAttribute("result", result);
//		}
//
//		return "customer/customerUpdate";
//	}
//	
//	@RequestMapping(value="/modify", method = RequestMethod.POST)
//	public String modify(Customer customer, String custpwd2, HttpSession session, Model model,
//			RedirectAttributes rttr) {
//		int result;
//		if (dao.selectOne(customer) == null) {
//			result = 0;
//			rttr.addAttribute("result", result);
//			return "redirect:/modify";
//		} else {
//			customer.setCustpwd(custpwd2);
//			dao.modifyCustomer(customer);
//			session.setAttribute("custname", customer.getCustname());
//			return "redirect:/";
//		}
//	}
//	
//	@RequestMapping(value="/delete", method = RequestMethod.GET)
//	public String delete(HttpSession session, String custid) {
//		dao.deleteCustomer(custid);
//		session.invalidate();
//		return "redirect:/";
//	}
}
