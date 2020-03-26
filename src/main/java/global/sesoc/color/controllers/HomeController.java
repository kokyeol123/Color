package global.sesoc.color.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "index";
	}
	
	@RequestMapping(value = "/naver", method = RequestMethod.GET)
	public String naver() {
		
		return "naver";
	}
	
	@PostMapping("/sendData")
	public void sendData(String name) {
		System.out.println("신호 도착 => " + name);
	}
	
	@ResponseBody
	@GetMapping("/myReceive")
	public String myReceive() {
		return "OK!!!";
	}
}
