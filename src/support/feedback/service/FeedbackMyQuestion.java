package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.CorpMemberDTO;
import member.model.MemberDTO;
import support.SupportService;
import support.faq.model.FaqDAO;
import support.feedback.model.FeedbackDAO;

public class FeedbackMyQuestion implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = null;
		MemberDTO mem = null;
		CorpMemberDTO corp = null;
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("User")==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "/member/Login");
			request.setAttribute("mainUrl", "alert");
		}else {
			Object user = session.getAttribute("User");
			
			if(user instanceof MemberDTO) {
				mem =  (MemberDTO)user;
				user_id = mem.getPid();
			}else {
				corp = (CorpMemberDTO)user;
				user_id = corp.getPid();
			}
			
			int page = (int)request.getAttribute("nowPage");
			
			int limit =8; // 한 페이지당 게시글 수
			int pageLimit = 4; // 페이지 번호 갯수
			
			FeedbackDAO dao = new FeedbackDAO();
			
			int total = dao.myTotalCnt(user_id);
			
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
			
			
			
			
			Object data = dao.mylist(start, limit, user_id);
			
			request.setAttribute("mainData", data);
			request.setAttribute("mainUrl", FEEDBACK+"MyQuestion");
			
			
			request.setAttribute("start", start);
			request.setAttribute("pageTotal", pageTotal);
			request.setAttribute("pageStart", pageStart);
			request.setAttribute("pageEnd", pageEnd);
			}
		}
		
}
