package mypage.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.CorpMemberDAO;
import member.model.CorpMemberDTO;
import mypage.MypageService;


public class InfoCorpMemberEdit_Reg implements MypageService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인 후 이용할 수 있습니다.");
			request.setAttribute("mainUrl", "alert");
			request.setAttribute("goUrl", "../../member/Login");
		}else {
			String pid = request.getParameter("pid");
			String pw = request.getParameter("pw");
			String nick_name = request.getParameter("nick_name");
			String corp_name = request.getParameter("corp_name");
			String corp_regnum = request.getParameter("corp_regnum"); 
			String corp_address = request.getParameter("address");
			String detailAddress = request.getParameter("detailAddress");
			String manager_name = request.getParameter("manager_name");
			String telecom = request.getParameter("telecom"); 
			String manager_num = request.getParameter("manager_num"); 
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String email = email1 + "@" + email2;
			
			CorpMemberDTO dto = new CorpMemberDTO();
			
			dto.setPid(pid);
			dto.setPw(pw);
			dto.setNick_name(nick_name);
			dto.setCorp_name(corp_name);
			dto.setCorp_regnum(corp_regnum);
			dto.setAddress(corp_address);
			dto.setDetailAddress(detailAddress);
			dto.setTelecom(telecom);
			dto.setManager_name(manager_name);
			dto.setManager_num(manager_num);
			dto.setEmail(email);
			
			
			CorpMemberDAO dao = new CorpMemberDAO();
			
			dao.editInfo(dto);
			
			session.setAttribute("User", null);
			
			request.setAttribute("msg", "회원정보가 수정되었습니다. 다시 로그인 해주세요");
			request.setAttribute("mainUrl", "alert");
			request.setAttribute("goUrl", "../../member/Login");
		}
	}

}
