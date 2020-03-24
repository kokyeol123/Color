package global.sesoc.color.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	// true 가 리턴이 되면 로그인이 되어있는거
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("LoginInterceptor========>");
		
		// 세션의 로그인 정보를 알아냄
		// 콘트롤러가 아니기때문에 session 을 파라미터로 못받고 직접 객체를 생성해 사용한다
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		// loginId가 null 이면 로그인 하지 않은 상태임
		if (loginId == null) {
			// 로그인 화면으로 이동함!!!
			// context.path를 뽑아냄
			String contextPath = request.getContextPath();
			
			response.sendRedirect(contextPath + "/login");
			
			return false;
		}
		
		return true;
	}

	
}
