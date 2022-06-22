package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.feedback.model.FeedbackDTO;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class FeedbackInsertAnswer implements SupportService{
	
	public FeedbackInsertAnswer() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		FeedbackDTO dto = new FeedbackDTO();
		dto.setId(request.getParameter("id"));
		dto.setUser_id(request.getParameter("user_id"));
		dto.setAnswer(request.getParameter("answer"));
		
		int res = new FeedbackDAO().insertAnswer(dto);
		
		String msg = "답변입력 실패", goUrl = "Detail?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "답변이 입력되었습니다.";
			goUrl = "Detail?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}
}
