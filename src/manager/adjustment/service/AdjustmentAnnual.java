package manager.adjustment.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import contents.ContentsService;

import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class AdjustmentAnnual implements ContentsService{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String year =null, month = null, manager = null;
		PaymentDAO dao = new PaymentDAO();
		
		String searchDate = "2022";
		
		
		if(request.getParameter("searchDate")!=null&& !request.getParameter("searchDate").equals("") ) {
			year = request.getParameter("searchDate");
			searchDate = year;
		}
		
		int page = (int)request.getAttribute("nowPage");
		
		int limit = 10; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
		int total = dao.managerTotalCnt(year);
		
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

		HashMap<String, Integer> managerTotalMoney = dao.managerTotal(searchDate, start, limit);
		
		Set<String> set = managerTotalMoney.keySet();
		
		Iterator it = set.iterator();
		
		int tot = 0;
		
		String keys = "['";
		String values = "['";
		
		while(it.hasNext()) {
			String key = (String)it.next();
			keys+=key+"','";
			values += (managerTotalMoney.get(key)/10000)+"','";
			tot += managerTotalMoney.get(key);
		}
		
		if(keys.lastIndexOf(',') != -1) {
			keys = keys.substring(0, keys.lastIndexOf(',')) + "]";
			values = values.substring(0, values.lastIndexOf(',')) + "]";
		}
		
		request.setAttribute("resultM", managerTotalMoney);
		request.setAttribute("keys", keys);
		request.setAttribute("values", values);
		request.setAttribute("tot", tot);
		request.setAttribute("searchDate", searchDate);
	
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		
		request.setAttribute("mainUrl", "manager/adjustment/Annual");
	}

}
