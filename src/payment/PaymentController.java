package payment;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contents.ContentsService;
import gym.GymService;

@WebServlet("/payment/*")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<String> nonClass;
    public PaymentController() {
        super();
        nonClass = new ArrayList<>();
        nonClass.add("InsertForm");
        nonClass.add("DeleteForm");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int page = 1;
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		request.setAttribute("nowPage", page);
		
		String serviceStr = request.getRequestURI().substring(
				(request.getContextPath()+"/payment/").length()
				);
		
		
		if(nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "payment/"+serviceStr);
		}else {
		
			try {
				ContentsService service = (ContentsService)Class.forName("payment.service.Payment"+serviceStr).newInstance();
				service.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/contents/template.jsp");
//		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
