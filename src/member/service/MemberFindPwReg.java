package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;


public class MemberFindPwReg implements MemberService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String memberkind = request.getParameter("memberkind");
		
		System.out.println("MemberFindPwReg ===> " + memberkind);
		
		request.setAttribute("memberkind", memberkind);
		request.setAttribute("email", email);
		request.setAttribute("mainUrl", "member/FindPwReg");
	}

}
