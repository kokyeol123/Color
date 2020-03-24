package global.sesoc.color.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//@ControllerAdvice
public class WebExceptionHandler {

	// 모든 종류의 익셉션을 처리
	@ExceptionHandler(Exception.class)
	public String errorHandler(Exception e, Model model) {
		model.addAttribute("errmsg", e.getMessage());
		return "/error";
	}
}
