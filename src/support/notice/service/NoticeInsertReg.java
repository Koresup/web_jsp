package support.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class NoticeInsertReg implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String title = request.getParameter("title");
		String filter = request.getParameter("filter");
		String content = request.getParameter("content");
		
		NoticeDTO dto = new NoticeDTO(title, filter, content);
		new NoticeDAO().insert(dto);
		
		request.setAttribute("msg", "작성되었습니다.");
		request.setAttribute("goUrl", "List");
		request.setAttribute("mainUrl", "alert");
	}

}
