package gym.basketball.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import member.model.CorpMemberDAO;
import support.notice.model.NoticeDAO;

public class BasketballInsertForm implements GymService{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		
		CorpMemberDAO dao = new CorpMemberDAO();
		
		Object data = dao.memList();
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", BASKETBALL+"InsertForm");
		
		
	}

}
