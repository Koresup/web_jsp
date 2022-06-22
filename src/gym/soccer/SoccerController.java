package gym.soccer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;

@WebServlet("/gym/soccer/*")
public class SoccerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<String> nonClass;
	
	
    public SoccerController() {
        super();
        nonClass = new ArrayList<>();
        nonClass.add("DeleteForm");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int page = 1;
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(new Date());
		if(request.getParameter("dateSet")!=null) {
			date = request.getParameter("dateSet");
		}
		
		request.setAttribute("nowPage", page);
		request.setAttribute("dateSet", date);
		
		String serviceStr = request.getRequestURI().substring(
				(request.getContextPath()+"/gym/soccer/").length()
				);
		
		if(nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "gym/soccer/"+serviceStr);
		}else {
		
			try {
				GymService service = (GymService)Class.forName("gym.soccer.service.Soccer"+serviceStr).newInstance();
				service.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		if(!serviceStr.equals("UploadImgEdit_Reg")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/contents/template.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
