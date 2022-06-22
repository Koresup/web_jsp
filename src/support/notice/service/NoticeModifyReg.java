package support.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class NoticeModifyReg implements SupportService{
	
	public NoticeModifyReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		NoticeDTO dto = new NoticeDTO();
		dto.setId(request.getParameter("id"));
		dto.setTitle(request.getParameter("title"));
		dto.setFilter(request.getParameter("filter"));
		dto.setContent(request.getParameter("content"));
		
		System.out.println(dto);
		
		int res = new NoticeDAO().modify(dto);
		
		String msg = "수정 실패", goUrl = "ModifyForm?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "수정되었습니다.";
			goUrl = "Detail?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}
}
