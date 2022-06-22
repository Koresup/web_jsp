package gym.soccer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.soccer.model.SoccerDAO;
import gym.soccer.model.SoccerDTO;

public class SoccerModifyForm implements GymService{
	
	public SoccerModifyForm() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		SoccerDAO dao = new SoccerDAO();
		
		SoccerDTO data = dao.detail(id);
		
		if(data.getImg()!=null) {
			String[] str = data.getImg().split(",");
			System.out.println(str.length);
			request.setAttribute("img_Cnt", str.length);
		}else {
			request.setAttribute("img_Cnt", 0);
		}
		
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", SOCCER+"ModifyForm");
	}
}
