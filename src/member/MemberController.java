package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ArrayList<String> nonClass;

	ArrayList<String> nonTemplate;

	public MemberController() {
		super();
		nonClass = new ArrayList<String>();
		nonClass.add("Main");
		nonClass.add("TypeSelect");
		nonClass.add("Login");
		nonClass.add("InsertCorpMember");
		nonClass.add("InsertMember");
		nonClass.add("FindId");
		nonClass.add("FindPw_CheckId");

		nonTemplate = new ArrayList<String>();
		nonTemplate.add("OverLap_Check");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String serviceStr = request.getRequestURI().substring((request.getContextPath() + "/member/").length());
		System.out.println("ServiceStr ==> " + serviceStr);
		request.setCharacterEncoding("utf-8");

		if (nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "member/" + serviceStr);
		} else {
			try {
				MemberService serv = (MemberService) Class.forName("member.service.Member" + serviceStr).newInstance();
				serv.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (!nonTemplate.contains(serviceStr)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/contents/template.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
