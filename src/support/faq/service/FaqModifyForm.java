package support.faq.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.faq.model.FaqDAO;

public class FaqModifyForm implements SupportService{
	
	public FaqModifyForm() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		FaqDAO dao = new FaqDAO();
		
		Object data = dao.detail(id);
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", FAQ+"ModifyForm");
	}
}
