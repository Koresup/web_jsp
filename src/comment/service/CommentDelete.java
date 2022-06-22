package comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.Comment_Service;
import comment.model.CommentDAO;


public class CommentDelete implements Comment_Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		new CommentDAO().delete(request.getParameter("comment_id"));
		
		request.setAttribute("mainUrl", "market/PostDetail");
	}

}
