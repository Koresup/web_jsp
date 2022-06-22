package gym.basketball.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import gym.basketball.model.BasketballDTO;
import support.SupportService;
import support.notice.model.NoticeDAO;

public class BasketballModifyForm implements GymService{
	
	public BasketballModifyForm() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		BasketballDAO dao = new BasketballDAO();
		
		BasketballDTO data = dao.detail(id);
		
		if(data.getImg()!=null) {
			String[] str = data.getImg().split(",");
			System.out.println(str.length);
			request.setAttribute("img_Cnt", str.length);
		}else {
			request.setAttribute("img_Cnt", 0);
		}
		
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", BASKETBALL+"ModifyForm");
	}
}
