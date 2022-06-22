package commu_soc.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/commu_soc/board/*")
public class Board_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ArrayList<String> nonClass;
	
    public Board_Controller() {
        super();
        nonClass = new ArrayList<String>();
        nonClass.add("InsertForm");
        nonClass.add("DeleteForm"); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String serviceStr = request.getRequestURI().substring(
				(request.getContextPath() + "/commu_soc/board/").length()
				);
		
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		request.setAttribute("nowPage", page);

		
		if (nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "commu_soc/board/"+serviceStr);

		} else {
			// 외워라
			try {
				BoardService service = 
						(BoardService) Class.forName("commu_soc.board.service.Board" + serviceStr)
						.newInstance(); // 임포트가 아니니 패키지 이름부터 땡겨야함

				service.execute(request, response);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (!serviceStr.equals("FileDown")) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/contents/template.jsp");
		
		dispatcher.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
