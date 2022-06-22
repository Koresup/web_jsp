package mypage.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberDAO;
import member.model.MemberDTO;
import mypage.MypageService;


public class InfoMemberEdit_Reg implements MypageService{
	
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
			String pname = request.getParameter("pname");
			String gender = request.getParameter("gender");
			String phonenum = request.getParameter("phonenum");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String email = email1 + "@" + email2;
			String address = request.getParameter("address");
			String detailAddress = request.getParameter("detailAddress");
			
			MemberDTO dto = new MemberDTO();
			
			dto.setPid(pid);
			dto.setPw(pw);
			dto.setNick_name(nick_name);
			dto.setpName(pname);
			dto.setGender(gender);
			dto.setPhoneNum(phonenum);
			dto.setEmail(email);
			dto.setAddress(address);
			dto.setDetailAddress(detailAddress);
			
			System.out.println(dto);
			
			MemberDAO dao = new MemberDAO();
			dao.editInfo(dto);
			
			
			session.setAttribute("User", null);
			request.setAttribute("msg", "회원정보가 수정되었습니다. 다시 로그인 하세요");
			request.setAttribute("mainUrl", "alert");
			request.setAttribute("goUrl", "/member/Login");
		}
	}

}
