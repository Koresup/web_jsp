package mypage.info;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.MypageService;



@WebServlet("/mypage/info/*")
public class InfoController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	ArrayList<String> nonClass;

	public InfoController() {
	        super();
	        nonClass = new ArrayList<String>();
	        nonClass.add("InputPass");
	    }
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String serviceStr = req.getRequestURI().substring(
				(req.getContextPath() + "/mypage/info/").length());
		System.out.println("ServiceStr ==> " + serviceStr);
		req.setCharacterEncoding("utf-8");
		
		if(nonClass.contains(serviceStr)) {
			req.setAttribute("mainUrl", "mypage/info/"+serviceStr);
		}else {
			try {
				MypageService serv = (MypageService)Class.forName("mypage.info.service.Info" + serviceStr).newInstance();
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
