package support.faq.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.faq.model.FaqDAO;
import support.faq.model.FaqDTO;

public class FaqDeleteReg implements SupportService{
	
	public FaqDeleteReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		
		FaqDTO dto = new FaqDTO();
		
		String id = request.getParameter("id");
		String deleteCheck = request.getParameter("deleteCheck");
		
		
		
		dto.setId(id);
		int res = 0;
		if(deleteCheck.equals("삭제")) {
			res = new FaqDAO().delete(dto);
		}
		 
		String msg = "삭제 실패", goUrl = "DeleteForm?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "삭제성공";
			goUrl = "List?page="+request.getAttribute("nowPage");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}
}
