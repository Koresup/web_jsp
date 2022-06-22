package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;
import member.model.CorpMemberDAO;
import member.model.CorpMemberDTO;
import member.model.MemberDAO;
import member.model.MemberDTO;


public class MemberFindPw_CertEmail implements MemberService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memberkind = (String) request.getParameter("memberkind");
		String userId = request.getParameter("pid");
		
		System.out.println(memberkind);
		if(memberkind.equals("개인회원")) {
			MemberDTO dto = new MemberDAO().findUser(userId);
			
			request.setAttribute("userEmail", dto.getEmail());
			request.setAttribute("mainUrl", "member/FindPw_CertEmail");
			request.setAttribute("memberkind", memberkind);
		} else if(memberkind.equals("법인회원")) {
			CorpMemberDTO dto = new CorpMemberDAO().findUser(userId);
			
			request.setAttribute("userEmail", dto.getEmail());
			request.setAttribute("mainUrl", "member/FindPw_CertEmail");
			request.setAttribute("memberkind", memberkind);
		}
	}
}
