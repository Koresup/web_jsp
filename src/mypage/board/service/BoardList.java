package mypage.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import commu_bas.board.model.BoardDAO;
import commu_bas.board.model.BoardDTO;
import commu_bas.compet.model.CompetDTO;
import commu_bas.guest.model.GuestDTO;
import market.model.MarketDAO;
import market.model.MarketDTO;
import member.model.CorpMemberDTO;
import member.model.MemberDTO;
import mypage.MypageService;
import mypage.board.model.MyBoardDAO;

public class BoardList implements MypageService{
	int pageTotal, start, pageStart, pageEnd;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		Object sUser = session.getAttribute("User");
		String board = request.getParameter("board");
		String user_id = "";
		
		MyBoardDAO dao = new MyBoardDAO();
		
		int page = (int)request.getAttribute("nowPage");
		 
		int limit =8; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
		int total = 0;
		
		
		
		if(sUser instanceof MemberDTO) {
			MemberDTO user = (MemberDTO)session.getAttribute("User");
			user_id = user.getPid();
		}else if(sUser instanceof CorpMemberDTO) {
			CorpMemberDTO user = (CorpMemberDTO)session.getAttribute("User");
			user_id = user.getPid();
		}
		
		
		if(board.contains("bas_board")) {
						
			total = dao.commu_bas_cnt(user_id);
			calcPaging(page, limit, pageLimit, total);
			
			ArrayList<BoardDTO> data = dao.commu_bas_list(start, pageLimit, user_id);
			
			request.setAttribute("mainData", data);
		}
		else if (board.contains("bas_compet")) {
			total = dao.commu_bas_compet_cnt(user_id);
			calcPaging(page, limit, pageLimit, total);
			
			ArrayList<CompetDTO> data = dao.commu_bas_compet_list(start, pageLimit, user_id);
			
			request.setAttribute("mainData", data);
		}
		else if (board.contains("bas_guest")) {
			total = dao.commu_bas_guest_cnt(user_id);
			calcPaging(page, limit, pageLimit, total);
			
			ArrayList<GuestDTO> data = dao.commu_bas_guest_list(start, pageLimit, user_id);
			
			request.setAttribute("mainData", data);
		}
		else if (board.contains("soc_board")) {
			total = dao.commu_soc_cnt(user_id);
			calcPaging(page, limit, pageLimit, total);
			
			ArrayList<commu_soc.board.model.BoardDTO> data = dao.commu_soc_list(start, pageLimit, user_id);
			
			request.setAttribute("mainData", data);
		}
		else if (board.contains("soc_compet")) {
			total = dao.commu_soc_compet_cnt(user_id);
			calcPaging(page, limit, pageLimit, total);
			
			ArrayList<commu_soc.compet.model.CompetDTO> data = dao.commu_soc_compet_list(start, pageLimit, user_id);
			
			request.setAttribute("mainData", data);
		}
		else if (board.contains("soc_guest")) {
			total = dao.commu_soc_guest_cnt(user_id);
			calcPaging(page, limit, pageLimit, total);
			
			ArrayList<commu_soc.guest.model.GuestDTO> data = dao.commu_soc_guest_list(start, pageLimit, user_id);
			
			request.setAttribute("mainData", data);
		}
		else if (board.contains("market")) {
			total = dao.market_cnt(user_id);
			calcPaging(page, limit, pageLimit, total);
			
			ArrayList<MarketDTO> data = dao.market_list(start, pageLimit, user_id);
			
			request.setAttribute("mainData", data);
		}		
		
//		int pageTotal = total/limit;
//		
//		if(total%limit > 0) {
//			pageTotal++;
//		}
//		
//		int start = (page-1)*limit;
//		
//		int pageStart = (page-1)/pageLimit*pageLimit+1;
//		
//		int pageEnd = pageStart+pageLimit-1;
//		if(pageEnd>pageTotal) {
//			pageEnd = pageTotal;
//		}
		
		
//		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "mypage/board/List");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
	}
	
	
	public void calcPaging(int page, int limit, int pageLimit, int total) {
		pageTotal = total/limit;
		
		if(total%limit > 0) {
			pageTotal++;
		}
		
		start = (page-1)*limit;
		
		pageStart = (page-1)/pageLimit*pageLimit+1;
		
		pageEnd = pageStart+pageLimit-1;
		
		if(pageEnd>pageTotal) {
			pageEnd = pageTotal;
		}
	}
}
