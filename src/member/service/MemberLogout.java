package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberService;


public class MemberLogout implements MemberService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String msg = "로그아웃 되었습니다.";
		String goUrl = "/index.jsp";
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "alert");
		request.setAttribute("goUrl", goUrl);
	}

}
