package comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.Comment_Service;
import comment.model.CommentDAO;
import comment.model.CommentDTO;
import member.model.CorpMemberDTO;
import member.model.MemberDTO;


public class CommentInsert implements Comment_Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String post_id = request.getParameter("post_id");
		String page = request.getParameter("page");
		String comment = request.getParameter("comment");
		String user_id = null; 
				
		if((session.getAttribute("User") instanceof MemberDTO)){
			MemberDTO user = (MemberDTO)session.getAttribute("User");
			user_id = user.getPid();
		}else {
			CorpMemberDTO user = (CorpMemberDTO)session.getAttribute("User");
			user_id = user.getPid();
		}
		
		CommentDTO dto = new CommentDTO();
		dto.setPost_id(post_id);
		dto.setComment_id("comment" + System.currentTimeMillis());
		dto.setComment_writer(user_id);
		dto.setContent(comment);
		
		
		new CommentDAO().insert(dto);
		
		request.setAttribute("msg", "댓글이 작성되었습니다.");
		request.setAttribute("mainUrl", "alert");

		String goUrl = "";
		if(post_id.contains("market")) {
	         goUrl = "/market/PostDetail_Reg?post_id="+post_id+"&page="+page;
	         
	      } else if(post_id.contains("commu_bas_board")) {
		     goUrl = "/commu_bas/board/Detail?post_id="+post_id+"&page="+page;
		     
	      } else if(post_id.contains("commu_bas_compet")) {
	    	  goUrl = "/commu_bas/compet/Detail?post_id="+post_id+"&page="+page;
	    	  
	      } else if(post_id.contains("commu_bas_guest")) {
	    	  goUrl = "/commu_bas/guest/Detail?post_id="+post_id+"&page="+page;
	    	  
	      } else if(post_id.contains("commu_soc_board")) {
	    	  goUrl = "/commu_soc/board/Detail?post_id="+post_id+"&page="+page;
	    	  
	      } else if(post_id.contains("commu_soc_compet")) {
	    	  goUrl = "/commu_soc/compet/Detail?post_id="+post_id+"&page="+page;
	    	  
	      } else if(post_id.contains("commu_soc_guest")) {
	    	  goUrl = "/commu_soc/guest/Detail?post_id="+post_id+"&page="+page;
	    	  
	      }else {
	    	  goUrl = "/market/PostDetail_Reg?post_id="+post_id+"&page="+page;
	      }
		
		request.setAttribute("goUrl", goUrl);
	}
	
}
