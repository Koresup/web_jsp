package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;
import member.model.CorpMemberDAO;
import member.model.CorpMemberDTO;



public class MemberCorpInsertReg implements MemberService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		int grade = 3;
		
		CorpMemberDTO dto = new CorpMemberDTO();
		dto.setPid(request.getParameter("pid"));
		dto.setPw(request.getParameter("pw"));
		dto.setNick_name(request.getParameter("nick_name"));
		dto.setCorp_name(request.getParameter("corp_name"));
		dto.setCorp_regnum(request.getParameter("corp_regnum"));
		dto.setEmail(email);
		dto.setAddress(request.getParameter("address"));
		dto.setDetailAddress(request.getParameter("detailAddress"));
		dto.setManager_name(request.getParameter("manager_name"));
		dto.setManager_num(request.getParameter("manager_num"));
		dto.setGrade(grade);
		
		new CorpMemberDAO().corpMemInsert(dto);;
		
		String msg = "회원가입 되었습니다.", goUrl ="/"; 
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}
			
}
