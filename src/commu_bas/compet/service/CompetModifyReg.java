package commu_bas.compet.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import commu_bas.compet.CompetService;
import commu_bas.compet.model.CompetDAO;
import commu_bas.compet.model.CompetDTO;

public class CompetModifyReg implements CompetService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "../../member/Login");
			request.setAttribute("mainUrl", "alert");
		} else {
			String realPath = "";
			String savePath = "/Users/minsookim/Desktop/프로젝트/04_proj/r2p/readytoplay/webapp/uploadFile/commu/bas/compet";
		    int maxSize = 10*1024*1024;
		    String type = "utf-8";
		    
		    realPath = savePath;
	
		    
		    String msg = null;
		    String goUrl = null;
		   
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
		                  int index = item.getName().lastIndexOf(separator);
		                  
		                  String fileName = item.getName().substring(index + 1);
		                  
		                  File uploadFile = new File(realPath + separator + fileName);
		                  
		                  allfile += fileName + ",";
		                  
		                  item.write(uploadFile);
		                  
		               } // if
		            } // else
		         } // for  
				
				CompetDTO dto = new CompetDTO();	
				
				dto.setHead(list.get("head"));
				dto.setTitle(list.get("title"));
				dto.setUpfile(list.get("upfile"));
				dto.setImg(list.get("img"));
				dto.setPost_id(list.get("post_id"));
				dto.setContent(list.get("content"));
	
				dto.setAllfile(allfile);
				
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
				
				
				int res = new CompetDAO().modify(dto);
				
				msg = "수정 실패";
				goUrl = "ModifyForm?post_id=" + dto.getPost_id();
	
				if (res > 0) {
					msg = "수정 성공";
					goUrl = "Detail?post_id=" + dto.getPost_id() + "&page=" + request.getAttribute("nowPage");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("goUrl", goUrl);
			request.setAttribute("mainUrl", "alert");
			System.out.println("CompetModifyReg execute() 실행");
			
		
		}
	}
	
}