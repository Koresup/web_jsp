package lesson.bas.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.bas.LessonService;
import lesson.bas.model.LessonDAO;


public class LessonSearchList implements LessonService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int page = 	(int)request.getAttribute("nowPage");
		String search = request.getParameter("search");
		String field = "list";

		if (!search.equals("")) {
			field = request.getParameter("field");
			System.out.println(field);
		}
		
		int limit = 8; // 한 페이지당 게시물 갯수
		int pageLimit = 5; // 페이지 번호 갯수
		int total = 0;
		
		LessonDAO dao = new LessonDAO();
		Object data = null;
		
		if(field.equals("list")) {
			total = dao.totalCntSearch(search);
		}else {
			total = dao.totalCntSearch(field, search);
			System.out.println(total);
		}
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
		
		if (field.equals("list")) {
			data = dao.list(start, limit, search);
		} else if (!field.equals("list") || field!=null) {
			data = dao.list(start, limit, field, search);
		}
		
		request.setAttribute("field", field);
		request.setAttribute("search", search);
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "lesson/bas/SearchList");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
	}
	
}