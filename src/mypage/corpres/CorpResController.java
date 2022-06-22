package mypage.corpres;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.MypageService;



@WebServlet("/mypage/corpres/*")
public class CorpResController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	ArrayList<String> nonClass;

	public CorpResController() {
	        super();
	        nonClass = new ArrayList<String>();
	    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int page = 1;
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		request.setAttribute("nowPage", page);
		String serviceStr = request.getRequestURI().substring(
				(request.getContextPath() + "/mypage/corpres/").length());
		System.out.println("ServiceStr ==> " + serviceStr);
		
		if(nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "mypage/corpres/"+serviceStr);
		}else {
			try {
				MypageService serv = (MypageService)Class.forName("mypage.corpres.service.CorpRes" + serviceStr).newInstance();
				serv.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/contents/template.jsp"); 
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
