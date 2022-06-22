package mypage.res;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.MypageService;



@WebServlet("/mypage/res/*")
public class ResController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	ArrayList<String> nonClass;

	public ResController() {
	        super();
	        nonClass = new ArrayList<String>();
	    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("여기");
		int page = 1;
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		request.setAttribute("nowPage", page);
		String serviceStr = request.getRequestURI().substring(
				(request.getContextPath() + "/mypage/res/").length());
		System.out.println("ServiceStr ==> " + serviceStr);
		
		if(nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "mypage/res/"+serviceStr);
		}else {
			try {
				MypageService serv = (MypageService)Class.forName("mypage.res.service.Res" + serviceStr).newInstance();
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
