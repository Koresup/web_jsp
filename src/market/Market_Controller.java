package market;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/market/*")
public class Market_Controller extends HttpServlet{
		private static final long serialVersionUID = 1L;
	
		ArrayList<String> nonClass;
		
	    public Market_Controller() {
	        super();
	        nonClass = new ArrayList<String>();
	    }
    
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String serviceStr = req.getRequestURI().substring(
					(req.getContextPath() + "/market/").length());
			System.out.println("ServiceStr ==> " + serviceStr);
			req.setCharacterEncoding("utf-8");
			
			int page = 1;
			
			if(req.getParameter("page")!=null) {
				page = Integer.parseInt(req.getParameter("page"));
			}
			
			req.setAttribute("nowPage", page);
			
			if(nonClass.contains(serviceStr)) {
				req.setAttribute("mainUrl", "market/"+serviceStr);
			}else {
				try {
					Market_Service serv =
							(Market_Service)Class.forName("market.service.Market" + serviceStr).newInstance();
					serv.execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}	
			}	
			RequestDispatcher dispatcher = req.getRequestDispatcher("/contents/template.jsp"); 
			dispatcher.forward(req, resp);
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
		
}
