package commu_soc.compet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import commu_soc.compet.CompetService;
import commu_soc.compet.model.CompetDAO;

public class CompetModifyForm implements CompetService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "../../member/Login");
			request.setAttribute("mainUrl", "alert");
		} else {
	//		int id = Integer.parseInt(request.getParameter("id"));
			String post_id = request.getParameter("post_id");
			CompetDAO dao = new CompetDAO();
			
			
			Object data = dao.detail(post_id);
			
			request.setAttribute("dto", data);
			request.setAttribute("mainUrl", "commu_soc/compet/ModifyForm");
			System.out.println("CompetModifyForm execute() 실행" + data);
		}
	}
}