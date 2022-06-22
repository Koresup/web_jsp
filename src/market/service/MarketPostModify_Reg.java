package market.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import market.Market_Service;
import market.model.MarketDAO;
import market.model.MarketDTO;

public class MarketPostModify_Reg implements Market_Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String realPath = "";
		String savePath = "C:/temp/jsp_work/readytoplay/webapp/uploadFile/market";
		int maxSize = 10 * 1024 * 1024;
		String type = "utf-8";

		realPath = savePath;

		String allImg = "";

		HashMap<String, String> map = new HashMap<String, String>();

		try {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			diskFileItemFactory.setRepository(new File(realPath));
			diskFileItemFactory.setSizeThreshold(maxSize);
			diskFileItemFactory.setDefaultCharset(type);
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);

			List<FileItem> items = fileUpload.parseRequest(request);

			for (FileItem item : items) {
				if (item.isFormField()) {
					map.put(item.getFieldName(), item.getString());

				} else {
					if (item.getSize() > 0) {
						String separator = File.separator;

						int index = item.getName().lastIndexOf(separator);

						String fileName = System.currentTimeMillis() + item.getName().substring(index + 1);
						File uploadFile = new File(realPath + separator + fileName);
						allImg += fileName + ",";

						item.write(uploadFile);

					} // if
				} // else
			} // for

			MarketDTO dto = new MarketDTO();

			dto.setPost_id(map.get("post_id"));
			dto.setTitle(map.get("title"));
			dto.setCheck_quality(map.get("check_quality"));
			dto.setL_category(map.get("l_category"));
			dto.setS_category(map.get("s_category"));
			dto.setDelivery(map.get("delivery"));
			dto.setPrice(Integer.parseInt(map.get("price")));
			dto.setContent(map.get("content"));
			dto.setImg(allImg);

			new MarketDAO().modify(dto);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("msg", "수정되었습니다.");
		request.setAttribute("goUrl", "PostList");
		request.setAttribute("mainUrl", "alert");
	}

}
