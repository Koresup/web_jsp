package commu_bas.compet.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import commu_bas.compet.CompetService;


public class CompetFileDown implements CompetService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "../../member/Login");
			request.setAttribute("mainUrl", "alert");
		} else {
			try {
				// 한글 파일 이름 변환 인코더
			   String fName = request.getParameter("fname");
			   String en = URLEncoder.encode(fName,"utf-8");
	
			   response.setHeader("Content-Disposition", "attachment; filename="+en);
	
			   // out.clear();
			   // out = PageContext.pushBody();
			   
			   String path = request.getRealPath("upFile");
			   path = "/Users/minsookim/Desktop/프로젝트/04_proj/r2p/readytoplay/webapp/uploadFile/commu/bas/compet";
			   path += "/"+fName;
	
			   FileInputStream fis = new FileInputStream(path);
			   ServletOutputStream sos = response.getOutputStream();
			   
			   byte[] buf = new byte[1024];
			   
			   while(fis.available()>0){
			      int len = fis.read(buf);
			      sos.write(buf,0,len);
			   }
			   
			   sos.close();
			   fis.close();
			   
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}