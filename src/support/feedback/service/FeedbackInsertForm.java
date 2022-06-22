package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import support.SupportService;
import support.feedback.model.FeedbackDAO;

public class FeedbackInsertForm implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("User")==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "/member/Login");
			request.setAttribute("mainUrl", "alert");
		}else {
			request.setAttribute("mainUrl", FEEDBACK+"InsertForm");
		}
	}
}
