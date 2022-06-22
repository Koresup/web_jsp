package gym.basketball.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import member.model.CorpMemberDTO;

public class BasketballReservationForm implements GymService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object user = session.getAttribute("User");
		
		if (session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "/member/Login");
			request.setAttribute("mainUrl", "alert");
		}else if(user instanceof CorpMemberDTO){
			request.setAttribute("msg", "예약은 일반 회원 계정으로 부탁드립니다!");
			request.setAttribute("goUrl", "back");
			request.setAttribute("mainUrl", "alert");
		}
		else {
			if(request.getParameter("timeSelect")!=null && !request.getParameter("timeSelect").equals("")) {
			String id = request.getParameter("id");
			BasketballDAO dao = new BasketballDAO();
			
			Object data = dao.detail(id);
			
			request.setAttribute("dto", data);
			request.setAttribute("timeSelect", request.getParameter("timeSelect"));
			request.setAttribute("totalPrice",request.getParameter("totalPrice"));
			request.setAttribute("dateSet",request.getParameter("dateSet"));
			request.setAttribute("mainUrl", BASKETBALL+"ReservationForm");
			}else {
				request.setAttribute("msg", "시간을 선택해야합니다.");
				request.setAttribute("goUrl", "back");
				request.setAttribute("mainUrl", "alert");
			}
		}
	}

}
