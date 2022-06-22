package commu_soc.board.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import commu_soc.board.BoardService;
import commu_soc.board.model.BoardDAO;
import commu_soc.board.model.BoardDTO;

public class BoardInsertReg implements BoardService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "../../member/Login");
			request.setAttribute("mainUrl", "alert");
		} else {
		// 파일 업로드
		String realPath = "";
		String savePath = "/Users/minsookim/Desktop/프로젝트/04_proj/r2p/readytoplay/webapp/uploadFile/commu/soc/board";
	    int maxSize = 10*1024*1024;
	    String type = "utf-8";
	    
	    realPath = savePath;

	    String title = "";
		String user_id = "";
		String post_id = "";
		String pw = "";
		String content = "";
		String allImg = "";
		String upfile = "";
		String allfile = "";
	    
	    HashMap<String, String> list = new HashMap<String, String>();
	    
	    try {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			diskFileItemFactory.setRepository(new File(realPath));
			diskFileItemFactory.setSizeThreshold(maxSize);
			diskFileItemFactory.setDefaultCharset(type);
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
			
			List<FileItem> items = fileUpload.parseRequest(request);
			
	         for (FileItem item : items) {
	            if (item.isFormField()) {
	               list.put(item.getFieldName(), item.getString());
	               
	            } else {
	               if (item.getSize() > 0) {
	                  String separator = File.separator;
	                  System.out.println();
	                  int index = item.getName().lastIndexOf(separator);
	                  String fileName = item.getName().substring(index + 1);
	                  File uploadFile = new File(realPath + separator + fileName);
	                  
	                  allImg += fileName + ",";
	                  
	                  item.write(uploadFile);
	                  
	                  
	               } // if
	            } // else
	         } // for 
	         

			title = list.get("title");
			user_id = list.get("user_id");
			post_id = list.get("post_id");
			pw = list.get("pw");
			content = list.get("content");

	         
			BoardDTO dto = new BoardDTO(title, user_id, post_id, content, allfile);
			
			String[] fileList = dto.getAllfile().split(",");
			
			
			for(int i =0; i<fileList.length; i++) {
				if(dto.isImg(fileList, i)) {
					allImg += fileList[i]+",";
				} else if(dto.isUpfile(fileList, i)) {
					upfile += fileList[i]+",";
				}
			}
			dto.setImg(allImg);
			dto.setUpfile(upfile);
			
			
			new BoardDAO().insert(dto);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("msg", "작성되었습니다");
		request.setAttribute("goUrl", "List");
		request.setAttribute("mainUrl", "alert");
		System.out.println("BoardInsertReg execute() 실행");
		
		}
		
	}
	
}