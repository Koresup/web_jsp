package lesson.bas.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.bas.LessonService;
import member.model.CorpMemberDAO;

public class LessonInsertForm implements LessonService{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		
		CorpMemberDAO dao = new CorpMemberDAO();
		
		Object data = dao.memList();
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "lesson/bas/InsertForm");
		
		
	}

}
