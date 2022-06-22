package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;
import member.model.CorpMemberDAO;
import member.model.CorpMemberDTO;
import member.model.MemberDAO;
import member.model.MemberDTO;


public class MemberFindIdReg implements MemberService{
	
	@Override	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			String email = request.getParameter("email1") + "@" + request.getParameter("email2");
			String memberKind = (String) request.getParameter("memberkind");
			
			if(memberKind.equals("개인회원")) {
				MemberDTO dto = new MemberDAO().findId(email);
				
				request.setAttribute("userId", dto.getPid());
			} else if(memberKind.equals("법인회원")) {
				CorpMemberDTO dto = new CorpMemberDAO().findId(email);
				System.out.println("MemberFindIdReg ===> " + "법인");
				request.setAttribute("userId", dto.getPid());

			}
			
			
			request.setAttribute("mainUrl", "/member/FindIdReg");
			
	}

}
