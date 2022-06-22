package support.faq.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.faq.model.FaqDAO;
import support.faq.model.FaqDTO;

public class FaqInsertReg implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		FaqDTO dto = new FaqDTO(question, answer);
		new FaqDAO().insert(dto);
		
		request.setAttribute("msg", "작성되었습니다.");
		request.setAttribute("goUrl", "List");
		request.setAttribute("mainUrl", "alert");
	}

}
