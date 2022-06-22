package support.faq;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;

@WebServlet("/support/faq/*")
public class FaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ArrayList<String> nonClass;
	
    public FaqController() {
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
				(request.getContextPath()+"/support/faq/").length()
				);		
		
		if(nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "support/faq/"+serviceStr);
		}else {
		
			try {
				SupportService service = (SupportService)Class.forName("support.faq.service.Faq"+serviceStr).newInstance();
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
