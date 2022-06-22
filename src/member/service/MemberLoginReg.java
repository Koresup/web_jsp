package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberService;
import member.model.CorpMemberDAO;
import member.model.CorpMemberDTO;
import member.model.MemberDAO;
import member.model.MemberDTO;


public class MemberLoginReg implements MemberService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String inputId = (String) request.getParameter("pid");
		String inputPw = (String) request.getParameter("pw");
		String memberkind = (String) request.getParameter("memberkind");

		
		String msg = "로그인 실패";
		String goUrl = "/Main/Main";
		
		if(memberkind.equals("개인회원")) {
			MemberDTO dto = new MemberDAO().findUser(inputId);
			if(dto == null) {
				msg = "아이디를 확인해주세요";
				goUrl = "Login";
			}else {
				if(inputPw.equals(dto.getPw())) {
					msg = "로그인 성공!";
					goUrl = "/index.jsp"; // 원래는 nowpage가 들어가야함
					HttpSession session = request.getSession();
					session.setAttribute("User", dto);
					
				} else {
					msg = "비밀번호를 확인해주세요";
					goUrl = "Login";
				}
			}
		} else {
			CorpMemberDTO dto = new CorpMemberDAO().findUser(inputId);
			if(dto == null) {
				msg = "아이디를 확인해주세요";
				goUrl = "Login";
			}else {
				if(inputPw.equals(dto.getPw())) {
					msg = "로그인 성공!";
					goUrl = "/"; // 원래는 nowpage가 들어가야함
					HttpSession session = request.getSession();
					session.setAttribute("User", dto);
					System.out.println(dto);
				} else {
					msg = "비밀번호를 확인해주세요";
					goUrl = "Login";
				}
			}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "alert");
		request.setAttribute("goUrl", goUrl); //Controller에서 nowpage를 Attribute로 전달받아 로그인 전 조회중이던 페이지로 이동해야함
		
	}
	
	

}
