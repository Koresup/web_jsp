package manager.adjustment.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import contents.ContentsService;

import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class AdjustmentSearch implements ContentsService{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String year =null, month = null, manager = null;
		PaymentDAO dao = new PaymentDAO();
		
		String searchDate = "2022";
		
		ArrayList<String> managerList = dao.managerList();
		
		ArrayList<PaymentDTO> data = null;
		
		if(request.getParameter("filter_year")!=null) {
			year = request.getParameter("filter_year");
			searchDate = year;
		}
		
		if(request.getParameter("filter_month")!=null&&!request.getParameter("filter_month").equals("")) {
			month = request.getParameter("filter_month");
			if(Integer.parseInt(month) <10) {
				searchDate += "-0"+month;
			}else {
				searchDate += "-"+month;
			}
		}
		
		if(request.getParameter("filter_manager")!=null) {
			manager = request.getParameter("filter_manager");
		}
		

//		HashMap<String, Integer> managerList = dao.managerTotal("2022");
		
		if(manager != null && !manager.equals("")) {
			data = dao.adjustmentList(searchDate, manager);
		}else {
			data = dao.searchDateList(searchDate);			
		}
		
		int totalPay = 0;
		
		if(data!=null) {
			for(PaymentDTO d : data) {
				if(!d.isRefund_reg()) {
					totalPay += d.getAmount();
				}
			}
		}
		
		ObjectMapper jacksonObject = new ObjectMapper();

//		try {
//			request.setAttribute("jacksonData", jacksonObject.writeValueAsString(data));
//			request.setAttribute("manager", jacksonObject.writeValueAsString(managerList));
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
		request.setAttribute("manager", managerList);
		request.setAttribute("mainData", data);
		request.setAttribute("tot", totalPay);
//		request.setAttribute("totalMoney", allAmountArr);
	
		request.setAttribute("mainUrl", "manager/adjustment/Search");
	}

}
