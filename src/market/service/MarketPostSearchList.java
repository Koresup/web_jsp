package market.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.Market_Service;
import market.model.MarketDAO;
import market.model.MarketDTO;

public class MarketPostSearchList implements Market_Service {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {

      // 검색어 없을 때 에러

      int page = (int) request.getAttribute("nowPage");
      String l_field = request.getParameter("l_field");
      String s_field = request.getParameter("s_field");
      String search = request.getParameter("search");

      int limit = 6; // 한 페이지에 보여줄 게시물 수
      int pageLimit = 4; // 페이지 번호 갯수
      int total = 0;

      MarketDAO dao = new MarketDAO();
      ArrayList<MarketDTO> data = null;

      if (l_field.equals("list") && s_field.equals("list")) {
         total = dao.totalCntSearch(search);
      } else if (!l_field.equals("list") && !s_field.equals("list")) {
         total = dao.totalCntSearch(l_field, s_field, search);
         request.setAttribute("s_field", s_field);
         request.setAttribute("l_field", l_field);
      } else if (l_field.equals("list") && !s_field.equals("list")) {
         total = dao.totalCntSearch(2, s_field, search);
         request.setAttribute("s_field", s_field);
      } else if (!l_field.equals("list") && s_field.equals("list")) {
         total = dao.totalCntSearch(1, l_field, search);
         request.setAttribute("l_field", l_field);
      }

      int pageTotal = total / limit;

      if (total % limit > 0) {
         pageTotal++;
      }

      int start = (page - 1) * limit;
      int pageStart = (page - 1) / pageLimit * pageLimit + 1;
      int pageEnd = (pageStart + pageLimit) - 1;

      if (pageEnd > pageTotal) {
         pageEnd = pageTotal;
      }

      /////////////////////////////////////////////////////// 이미지없을때 
      if (l_field.equals("list") && s_field.equals("list")) {
         data = dao.list(start, limit, search);
         for (int i = 0; i < data.size(); i++) {
            if ((data.get(i).getImg()!=null)&&(!data.get(i).getImg().equals(""))) {
               String[] imgList = data.get(i).getImg().split(",");
               data.get(i).setFirstImg(imgList[0]);
            }
         }
      } else if (!l_field.equals("list") && !s_field.equals("list")) {
         data = dao.list(start, limit, l_field, s_field, search);
         for (int i = 0; i < data.size(); i++) {
            if ((data.get(i).getImg()!=null)&&(!data.get(i).getImg().equals(""))) {
               String[] imgList = data.get(i).getImg().split(",");
               data.get(i).setFirstImg(imgList[0]);
            }
         }
         request.setAttribute("l_field", l_field);
         request.setAttribute("s_field", s_field);
      } else if (l_field.equals("list") && !s_field.equals("list")) {
         data = dao.list(start, limit, 2, s_field, search);
         for (int i = 0; i < data.size(); i++) {
            if ((data.get(i).getImg()!=null)&&(!data.get(i).getImg().equals(""))) {
               String[] imgList = data.get(i).getImg().split(",");
               data.get(i).setFirstImg(imgList[0]);
            }
         }
         request.setAttribute("s_field", s_field);
      } else if (!l_field.equals("list") && s_field.equals("list")) {
         data = dao.list(start, limit, 1, l_field, search);
         for (int i = 0; i < data.size(); i++) {
            if ((data.get(i).getImg()!=null)&&(!data.get(i).getImg().equals(""))) {
               String[] imgList = data.get(i).getImg().split(",");
               data.get(i).setFirstImg(imgList[0]);
            }
         }
         request.setAttribute("l_field", l_field);
      }

      request.setAttribute("search", search);
      request.setAttribute("mainData", data);
      request.setAttribute("mainUrl", "market/PostSearchList");

      request.setAttribute("start", start);
      request.setAttribute("pageTotal", pageTotal);
      request.setAttribute("pageStart", pageStart);
      request.setAttribute("pageEnd", pageEnd);
   }

}