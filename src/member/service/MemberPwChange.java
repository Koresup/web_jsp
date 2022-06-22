package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;
import member.model.CorpMemberDAO;
import member.model.CorpMemberDTO;
import member.model.MemberDAO;
import member.model.MemberDTO;


public class MemberPwChange implements MemberService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memberKind = request.getParameter("memberkind");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String msg = "비밀번호 변경에 실패했습니다.";
		String goUrl = "";

		
		if(memberKind.equals("개인회원")) {
			MemberDTO dto = new MemberDAO().findId(email);
			dto.setPw(pw);
			new MemberDAO().pwChange(dto);
			msg = "변경된 비밀번호로 로그인 해주세요.";
			goUrl = "/member/Login";
		} else if(memberKind.equals("법인회원")) {
			CorpMemberDTO dto = new CorpMemberDAO().findId(email);
			dto.setPw(pw);
			new CorpMemberDAO().pwChange(dto);
			msg = "변경된 비밀번호로 로그인 해주세요.";
			goUrl = "/member/Login";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "alert");
		request.setAttribute("goUrl", goUrl);
	}

}
