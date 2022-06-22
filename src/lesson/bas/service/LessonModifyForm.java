package lesson.bas.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lesson.bas.LessonService;
import lesson.bas.model.LessonDAO;


public class LessonModifyForm implements LessonService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
//		if(session.getAttribute("User") == null) {
//			request.setAttribute("msg", "관리자만 이용할 수 있습니다.");
//			request.setAttribute("mainUrl", "alert");
//			request.setAttribute("goUrl", "../../member/Login");
//		}else {
			String post_id = request.getParameter("post_id");
			LessonDAO dao = new LessonDAO();
			
			
			Object data = dao.detail(post_id);
			
			request.setAttribute("dto", data);
			request.setAttribute("mainUrl", "lesson/bas/ModifyForm");
		}
//	}
}