package market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.Market_Service;
import market.model.MarketDAO;


public class MarketPostModify implements Market_Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		String post_id = (String)request.getParameter("post_id");
		System.out.println("post_id ===> " + post_id);
		MarketDAO dao = new MarketDAO();
		
		Object data = dao.detail(post_id);
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", "market/PostModify");
	}

}
