package gym.soccer.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import gym.GymService;
import gym.soccer.model.SoccerDAO;
import gym.soccer.model.SoccerDTO;

public class SoccerInsertReg implements GymService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String realPath = "";
		String savePath = "C:\\temp\\jsp_work\\readytoplay\\webapp\\uploadFile\\gym\\soccer";
		
		int maxSize = 10*1024*1024;
	    String type = "utf-8";
	    realPath = savePath;
	    HashMap<String, String> map = new HashMap<String, String>();
	    String allImg = "";
	    
	    try {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			diskFileItemFactory.setRepository(new File(realPath));
			diskFileItemFactory.setSizeThreshold(maxSize);
			diskFileItemFactory.setDefaultCharset(type);
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
			
			
			List<FileItem> items = fileUpload.parseRequest(request);
			int i = 1;
			String unused_time ="";
	         for (FileItem item : items) {
	            if (item.isFormField()) {
	               if(item.getFieldName().equals("unused_time")) {
	            	   unused_time += item.getString()+",";
	            	   map.put(item.getFieldName(), unused_time);
	               }else {
	            	   map.put(item.getFieldName(), item.getString());
	               }
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
	         
	         SoccerDTO dto = new SoccerDTO();
	         dto.setId("gym_soccer"+System.currentTimeMillis());
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
	         dto.setPrice_weekday_weekly(Integer.parseInt(map.get("price_weekday_weekly")));
	         dto.setPrice_weekday_nighttime(Integer.parseInt(map.get("price_weekday_nighttime")));
	         dto.setPrice_weekend_weekly(Integer.parseInt(map.get("price_weekend_weekly")));
	         dto.setPrice_weekend_nighttime(Integer.parseInt(map.get("price_weekend_nighttime")));
	         dto.setPostcode(map.get("postcode"));
	         dto.setAddress(map.get("address"));
	         dto.setAddress_detail(map.get("detailAddress"));
	         dto.setImg(allImg);
	         dto.setManager_id(map.get("manager_id"));
	         
	         if(map.get("unused_time") != null) {
	        	 dto.setUnused_time(map.get("unused_time").substring(0, map.get("unused_time").lastIndexOf(',')) );
	         }
	         new SoccerDAO().insert(dto);
	         
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		request.setAttribute("msg", "작성되었습니다.");
		request.setAttribute("goUrl", "List");
		request.setAttribute("mainUrl", "alert");
	}

}
