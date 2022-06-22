package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.feedback.model.FeedbackDTO;

public class FeedbackInsertReg implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String title = request.getParameter("title");
		String filter = request.getParameter("filter");
		String content = request.getParameter("content");
		String user_id = request.getParameter("user_id");
		
		FeedbackDTO dto = new FeedbackDTO(title, content, filter, user_id);
		
		new FeedbackDAO().insert(dto);
		
		request.setAttribute("msg", "작성되었습니다.");
		request.setAttribute("goUrl", "home");
		request.setAttribute("mainUrl", "alert");
	}

}
