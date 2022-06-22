package commu_soc.guest.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commu_soc.guest.GuestService;
import commu_soc.guest.model.GuestDAO;

public class GuestList implements GuestService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int page = 	(int)request.getAttribute("nowPage");

		
		int limit = 10; // 한 페이지당 게시물 갯수
		int pageLimit = 5; // 페이지 번호 갯수
		
		GuestDAO dao = new GuestDAO();
		
		int total = dao.totalCnt();
		int pageTotal = total/limit;
		
		if (total%limit > 0) {
			pageTotal++;
		}
		
		int start = (page-1) * limit;
		int pageStart = (page-1) / pageLimit * pageLimit + 1;
		int pageEnd = pageStart + pageLimit -1;
		
		if(pageEnd > pageTotal) {
			pageEnd = pageTotal;
		}
		
		Object data = dao.list(start, limit);
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "commu_soc/guest/List");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);

	}
	
}