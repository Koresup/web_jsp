package lesson.bas.service;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.bas.LessonService;
import lesson.bas.model.LessonDAO;
import lesson.bas.model.LessonDTO;


public class LessonDeleteReg implements LessonService{
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		LessonDTO dto = new LessonDTO();
		String post_id = request.getParameter("post_id");
		dto.setPost_id(post_id);

		String deleteCheck = request.getParameter("deleteCheck");
		
		LessonDTO delDTO = new LessonDAO().detail(post_id);
		
		int res =0;
		if(deleteCheck.equals("삭제")) {
			res = new LessonDAO().delete(dto);
		}
		
		
		String msg = "삭제 실패", 
				goUrl = "DeleteForm?post_id=" + dto.getPost_id();
		
		
		if (res > 0) {
			
			msg = "삭제 성공";
			goUrl = "List?page=" + request.getAttribute("nowPage");
			
			if (delDTO.getImg() != null) {
				String images = delDTO.getImg();
				String[] tokens = images.split(",");
				
				String path = request.getRealPath("board");
				path = "/Users/minsookim/Desktop/프로젝트/04_proj/r2p/readytoplay/webapp/uploadFile/lesson/bas";
				
				for(int i =0; i<tokens.length; i++) {
					System.out.println(path + "\\" + tokens[i]);
					new File(path + "\\" + tokens[i]).delete();
				}
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
		
	}
}