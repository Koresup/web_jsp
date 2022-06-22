package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.feedback.model.FeedbackDTO;

public class FeedbackDeleteReg implements SupportService{
	
	public FeedbackDeleteReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		
		FeedbackDTO dto = new FeedbackDTO();
		
		String id = request.getParameter("id");
		String deleteCheck = request.getParameter("deleteCheck");
		
		
		
		dto.setId(id);
		int res = 0;
		if(deleteCheck.equals("삭제")) {
			res = new FeedbackDAO().delete(dto);
		}
		 
		String msg = "삭제 실패", goUrl = "DeleteForm?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "삭제성공";
			goUrl = "home";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}
}
