package mypage.corpres.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import member.model.CorpMemberDTO;
import mypage.MypageService;
import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class CorpResSearch implements MypageService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		CorpMemberDTO user = (CorpMemberDTO)session.getAttribute("User");
		
		
		PaymentDAO dao = new PaymentDAO();
		
		int page = (int)request.getAttribute("nowPage");
		
		int limit =8; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
		
		int total = dao.corpTotalCnt(user.getPid());
		
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
		
		ArrayList<PaymentDTO> data = dao.corpList(user.getPid(), start, limit);
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "mypage/corpres/List");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
	}

}
