package market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.Market_Service;
import market.model.MarketDAO;


public class MarketPostDelete_Reg implements Market_Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			String post_id = request.getParameter("post_id");
			
			new MarketDAO().delete(post_id);
			
			request.setAttribute("msg", "삭제되었습니다.");
			request.setAttribute("goUrl", "PostList");
			request.setAttribute("mainUrl", "alert");
	}

}
