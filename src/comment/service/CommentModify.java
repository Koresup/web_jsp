package comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.Comment_Service;
import comment.model.CommentDAO;
import comment.model.CommentDTO;


public class CommentModify implements Comment_Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			String content = request.getParameter("comment_input");
			String comment_id = request.getParameter("comment_id");
			String post_id = request.getParameter("post_id");
			String comment_writer = request.getParameter("comment_writer");
			
			CommentDTO dto = new CommentDTO();
			dto.setPost_id(post_id);
			dto.setComment_id(comment_id);
			dto.setComment_writer(comment_writer);
			dto.setContent(content);
			
			new CommentDAO().modify(dto);
			
			request.setAttribute("mainUrl", "market/PostDetail");
	}

}
