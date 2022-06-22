package member.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;
import member.model.CorpMemberDAO;
import member.model.MemberDAO;


public class MemberOverLap_Check implements MemberService{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			String user_id = request.getParameter("pid");

			String checkId = "false";
			if(user_id.equals("")) {
				checkId = "null";
			} else if(new MemberDAO().idCheck(user_id).equals("useable") && new CorpMemberDAO().idCheck(user_id).equals("useable")) {
				checkId = "true";
			} else if(new MemberDAO().idCheck(user_id).equals("unuseable") || new CorpMemberDAO().idCheck(user_id).equals("unuseable")) {
				checkId = "false";
			}
			
			try {
				response.getWriter().append(checkId);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
	}

}
