package support.faq.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.faq.model.FaqDAO;

public class FaqList implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int page = (int)request.getAttribute("nowPage");
		
		int limit =8; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
		FaqDAO dao = new FaqDAO();
		
		int total = dao.totalCnt();
		
		int pageTotal = total/limit;
		
		if(total%limit > 0) {
			pageTotal++;
		}
		
		int start = (page-1)*limit;
		
		int pageStart = (page-1)/pageLimit*pageLimit+1;
		
		int pageEnd = pageStart+pageLimit-1;
		if(pageEnd>pageTotal) {
			pageEnd = pageTotal;
		}
		
		Object data = dao.list(start, limit);
		
		
		String[] onetwo = new String[] {"headingOne","headingTwo","headingThree","headingFour","headingFive","headingSix","headingSeven","headingEight"};	
		String[] onetwoCol = new String[] {"collapseOne","collapseTwo","collapseThree","collapseFour","collapseFive","collapseSix","collapseSeven","collapseEight"};	
		String[] onetwoColshop = new String[] {"#collapseOne","#collapseTwo","#collapseThree","#collapseFour","#collapseFive","#collapseSix","#collapseSeven","#collapseEight"};	
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", FAQ+"List");
		
		
		request.setAttribute("onetwo", onetwo);
		request.setAttribute("onetwoCol", onetwoCol);
		request.setAttribute("onetwoColshop", onetwoColshop);
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		
	}

}
