package lesson.bas.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import lesson.bas.LessonService;
import lesson.bas.model.LessonDAO;
import lesson.bas.model.LessonDTO;


public class LessonModifyReg implements LessonService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
//		if(session.getAttribute("User") == null) {
//			request.setAttribute("msg", "관리자만 이용할 수 있습니다.");
//			request.setAttribute("mainUrl", "alert");
//			request.setAttribute("goUrl", "member/Login");
//		}
//		else {	
			String realPath = "";
			String savePath = "/Users/minsookim/Desktop/프로젝트/04_proj/r2p/readytoplay/webapp/uploadFile/lesson/bas";
		    int maxSize = 10*1024*1024;
		    String type = "utf-8";
		    realPath = savePath;
	
		    String msg = null, goUrl = null;
		    String allImg = "";
		    
		    HashMap<String, String> map = new HashMap<String, String>();
		    
		    try {
				DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
				diskFileItemFactory.setRepository(new File(realPath));
				diskFileItemFactory.setSizeThreshold(maxSize);
				diskFileItemFactory.setDefaultCharset(type);
				ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
				
				List<FileItem> items = fileUpload.parseRequest(request);
		         int i = 1;
				for (FileItem item : items) {
		            if (item.isFormField()) {
		               map.put(item.getFieldName(), item.getString());
		               
		            } else {
		               if (item.getSize() > 0) {
		            	   String separator = File.separator;
		                  int index = item.getName().lastIndexOf(".");
		                  String expert = item.getName().substring(index);
		                  
		                  String fileName = "img"+System.currentTimeMillis()+i+expert;
		                  
		                  File uploadFile = new File(realPath + separator + fileName);
		                  allImg += fileName + ",";
		                  
		                  item.write(uploadFile);
		                  i++;
		               } // if
		            } // else
		         } // for 
		        
				 LessonDTO dto = new LessonDTO();
				 
		         dto.setCategory(map.get("category"));
		         dto.setSname(map.get("sname"));
		         dto.setContents_info(map.get("contents_info"));
		         dto.setContents_detail(map.get("contents_detail"));
		         dto.setContents_rule(map.get("contents_rule"));
		         dto.setContents_refund(map.get("contents_refund"));
		         dto.setOption1((map.get("option1")!=null)? Boolean.parseBoolean(map.get("option1")):false);
		         dto.setOption2((map.get("option2")!=null)? Boolean.parseBoolean(map.get("option2")):false);
		         dto.setOption3((map.get("option3")!=null)? Boolean.parseBoolean(map.get("option3")):false);
		         dto.setOption4((map.get("option4")!=null)? Boolean.parseBoolean(map.get("option4")):false);
		         dto.setOption5((map.get("option5")!=null)? Boolean.parseBoolean(map.get("option5")):false);
		         dto.setPrice(Integer.parseInt(map.get("price")));
		         dto.setLesson_time(map.get("lesson_time"));
		         dto.setMax_student(Integer.parseInt(map.get("max_student")));
		         dto.setPostcode(map.get("postcode"));
		         dto.setAddress(map.get("address"));
		         dto.setAddress_detail(map.get("address_detail"));
		         dto.setImg(allImg);
		         dto.setManager_id(map.get("manager_id"));
		         dto.setPost_id(map.get("post_id"));
	
		        
		         int res =  new LessonDAO().modify(dto);
					
		         msg = "수정 실패"; 
		         goUrl = "ModifyForm?post_id=" + dto.getPost_id();
				
			
		         if (res > 0) {
					msg = "수정 성공";
					goUrl = "Detail?post_id=" + dto.getPost_id() + "&page=" + request.getAttribute("nowPage");
		         }
	         	        
	
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("goUrl", goUrl);
			request.setAttribute("mainUrl", "alert");
			
		
		}
//	}
	
}