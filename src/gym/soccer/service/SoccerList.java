package gym.soccer.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import gym.GymService;
import gym.soccer.model.SoccerDAO;
import gym.soccer.model.SoccerDTO;
import payment.model.PaymentDAO;

public class SoccerList implements GymService{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd E");
		String today = format.format(new Date());
		
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int page = (int)request.getAttribute("nowPage");
		
		int limit =8; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
		
		SoccerDAO dao = new SoccerDAO();
		
		int total = dao.totalCnt();
		
		int pageTotal = total/limit;
		
		if(total%limit > 0) {
			pageTotal++;
		}
		
		int start = (page-1)*limit;
		
		int pageStart = (page-1)/pageLimit*pageLimit+1;
		
		int pageEnd = pageStart+pageLimit-1;
		if(pageEnd>pageTotal) {
			pageEnd = pageTotal;
		}
		
		ArrayList<SoccerDTO> data = dao.list(start, limit);
		
		ArrayList<String> resdateList = null;
		
		if(request.getParameter("dateSet")!= null) {
			resdateList = new PaymentDAO().paymentSoccerList(data, request.getParameter("dateSet"));
			request.setAttribute("dateSet", request.getParameter("dateSet"));
		}else {
			resdateList = new PaymentDAO().paymentSoccerList(data, today);
			request.setAttribute("dateSet", today);
		}
		System.out.println(resdateList);
		ObjectMapper jacksonObject = new ObjectMapper();
		
		String resStr = "['";
		String unusedTime = "['";
		for(int i =0; i<resdateList.size(); i++) {
			if(i==resdateList.size()-1) {
				resStr += resdateList.get(i)+ "']";
				unusedTime += data.get(i).getUnused_time()+ "']";
				
			}else {
				resStr+=resdateList.get(i)+"','";
				unusedTime+=data.get(i).getUnused_time()+"','";
			}
			
		}
		try {
			;
			request.setAttribute("resdateJson", jacksonObject.writeValueAsString(resdateList));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("resdateList", resStr);
		request.setAttribute("unused", unusedTime);
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", SOCCER+"List");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		
	}

}
