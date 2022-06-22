package gym.basketball.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class BasketballDetail implements GymService{
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String today = format.format(new Date());
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		String resDate = request.getParameter("dateSet");
		if(request.getParameter("dateSet") == null) {
			resDate = today;
		}
		
		BasketballDAO dao = new BasketballDAO();
		
		Object data = dao.detail(id);
		
		ArrayList<PaymentDTO> resData = new PaymentDAO().myList(id, resDate);
		String resTime = "";
		
		
		if(resData != null) {
			for(int i =0; i<resData.size(); i++) {
				if(!resData.get(i).isRefund_reg()) {
					resTime += resData.get(i).getResTime();
				}
				
				if(i != (resData.size()-1)) {
					System.out.println("ggg");
					resTime += ",";
				}
			}
		}
		
		request.setAttribute("dto", data);
		request.setAttribute("resData", resTime);
		request.setAttribute("mainUrl", BASKETBALL+"Detail");
	}

}
