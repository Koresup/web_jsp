package gym.basketball.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import gym.basketball.model.BasketballDTO;
import support.SupportService;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class BasketballDeleteReg implements GymService{
	
	public BasketballDeleteReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		
		BasketballDTO dto = new BasketballDTO();
		
		String id = request.getParameter("id");
		String deleteCheck = request.getParameter("deleteCheck");
		
		
		
		dto.setId(id);
		int res = 0;
		if(deleteCheck.equals("삭제")) {
			res = new BasketballDAO().delete(dto);
		}
		 
		String msg = "삭제 실패", goUrl = "DeleteForm?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "삭제성공";
			goUrl = "List?page="+request.getAttribute("nowPage");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}
}
