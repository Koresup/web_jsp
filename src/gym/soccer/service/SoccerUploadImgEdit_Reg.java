package gym.soccer.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.soccer.model.SoccerDAO;
import gym.soccer.model.SoccerDTO;

public class SoccerUploadImgEdit_Reg implements GymService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		SoccerDTO delDTO = new SoccerDAO().detail(id);

		int res = new SoccerDAO().modifyFile(id);
		if (res > 0) {
			if (delDTO.getImg() != null) {
				String images = delDTO.getImg();
				String[] tokens = images.split(",");

				String path = request.getRealPath("board");
				path = "C:\\temp\\jsp_work\\readytoplay\\webapp\\uploadFile\\gym\\soccer";
				
				for (int i = 0; i < tokens.length; i++) {
					System.out.println(path + "\\" + tokens[i]);
					new File(path + "\\" + tokens[i]).delete();
				}
			}
		}

		request.setAttribute("mainUrl", "gym/soccer/ModifyForm");
	}
}
