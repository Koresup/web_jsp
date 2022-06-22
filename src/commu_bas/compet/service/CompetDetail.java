package commu_bas.compet.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.model.CommentDAO;
import comment.model.CommentDTO;
import commu_bas.compet.CompetService;
import commu_bas.compet.model.CompetDAO;

public class CompetDetail implements CompetService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "../../member/Login");
			request.setAttribute("mainUrl", "alert");
		} else {
	//		int id = Integer.parseInt(request.getParameter("id"));
			String post_id = request.getParameter("post_id");
			CompetDAO dao = new CompetDAO();
			ArrayList<CommentDTO> comment_dto = new CommentDAO().list(post_id);
			
			
			
			dao.addCount(post_id);
			Object data = dao.detail(post_id);
			
			request.setAttribute("dto",data);
			request.setAttribute("comment_dto", comment_dto);
			request.setAttribute("mainUrl", "commu_bas/compet/Detail");	
		}
	}
	
}