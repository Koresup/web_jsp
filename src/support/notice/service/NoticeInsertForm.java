package support.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberDTO;
import support.SupportService;
import support.notice.model.NoticeDAO;

public class NoticeInsertForm implements SupportService{
	
	public NoticeInsertForm() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("User") != null && (session.getAttribute("User") instanceof MemberDTO)) {
			MemberDTO user = (MemberDTO)session.getAttribute("User");
			
			if(user.getGrade() == 1) {
				request.setAttribute("mainUrl", NOTICE+"InsertForm");
			}else {
				request.setAttribute("msg", "정상적인 접근이 아닙니다.");
				request.setAttribute("goUrl", "back");
				request.setAttribute("mainUrl", "alert");
			}
		}else {
			request.setAttribute("msg", "정상적인 접근이 아닙니다.");
			request.setAttribute("goUrl", "back");
			request.setAttribute("mainUrl", "alert");
		}
		
	}
}
