package payment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import contents.ContentsService;
import gym.GymService;
import gym.basketball.model.BasketballDAO;
import lesson.bas.model.LessonDAO;

public class PaymentReservationForm implements ContentsService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "../member/Login");
			request.setAttribute("mainUrl", "alert");
		} else {
		String id = request.getParameter("id");
		
		if(id.contains("lesson")) {
			LessonDAO dao = new LessonDAO();
			Object data = dao.detail(id);
			request.setAttribute("dto", data);
			request.setAttribute("dataType","lesson");
		}else if(id.contains("gym_basketball")){
			BasketballDAO dao = new BasketballDAO();
			Object data = dao.detail(id);
			request.setAttribute("dto", data);
			request.setAttribute("dataType","gym");
		}
		
		
		
		request.setAttribute("timeSelect", request.getParameter("timeSelect"));
		request.setAttribute("totalPrice",request.getParameter("totalPrice"));
		request.setAttribute("dateSet",request.getParameter("dateSet"));
		request.setAttribute("mainUrl", "payment/ReservationForm");
	}
	}
}
