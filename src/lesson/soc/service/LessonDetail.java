package lesson.soc.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.soc.LessonService;
import lesson.soc.model.LessonDAO;


public class LessonDetail implements LessonService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String post_id = request.getParameter("post_id");
		LessonDAO dao = new LessonDAO();
		
		Object data = dao.detail(post_id);
		
		request.setAttribute("dto",data);
		request.setAttribute("mainUrl", "lesson/soc/Detail");
		
	}
	
}