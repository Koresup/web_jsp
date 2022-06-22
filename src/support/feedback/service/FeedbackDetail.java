package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.notice.model.NoticeDAO;

public class FeedbackDetail implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		FeedbackDAO dao = new FeedbackDAO();
		
		Object question = dao.detail(id);
		
		request.setAttribute("dto", question);
		request.setAttribute("mainUrl", FEEDBACK+"Detail");
	}

}
