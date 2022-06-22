package support.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class NoticeDeleteReg implements SupportService{
	
	public NoticeDeleteReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		
		NoticeDTO dto = new NoticeDTO();
		
		String id = request.getParameter("id");
		
		String deleteCheck = request.getParameter("deleteCheck");
		
		System.out.println("id : "+id);
		System.out.println("del : "+deleteCheck);
		
		dto.setId(id);
		int res = 0;
		if(deleteCheck.equals("삭제")) {
			res = new NoticeDAO().delete(dto);
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
