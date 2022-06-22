package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.feedback.model.FeedbackDTO;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class FeedbackModifyReg implements SupportService{
	
	public FeedbackModifyReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		FeedbackDTO dto = new FeedbackDTO();
		dto.setId(request.getParameter("id"));
		dto.setTitle(request.getParameter("title"));
		dto.setFilter(request.getParameter("filter"));
		dto.setQuestion(request.getParameter("content"));
		dto.setUser_id(request.getParameter("user_id"));
		dto.setAnswer(request.getParameter("answer"));
		
		
		int res = new FeedbackDAO().modify(dto);
		
		String msg = "수정 실패", goUrl = "ModifyForm?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "수정되었습니다.";
			goUrl = "Detail?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
			System.out.println(goUrl);
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}
}
