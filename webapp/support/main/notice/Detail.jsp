<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<h1>공지사항</h1>
 <style>

    div#div_detail{
      width:980px;
      margin:0px auto;
      border: solid 1px black;
      font-size: 30px;
      margin-top: 5px;
    }

    div#detail_title{
      font-size: 40px;
      margin-top: 5px;
    }

    div#detail_filter{
      font-size: 20px;
      float:left;
    }

    div#detail_date{
      font-size: 20px;
      margin-left: 10px;
    }

    div#detail_content{
      font-size: 30px;
      margin-top: 5px;
    }
    
    
  </style>

  <h1>상세</h1>

    <div id = div_detail>
      <div id = "detail_title">
        ${dto.notice_title }
      </div>

      <div id = "detail_filter">
         ${dto.notice_filter } | 
      </div>

      <div id = "detail_date">
          ${dto.reg_date }
      </div>

      <div id = "detail_content">
        <p> ${dto.notice_content }</p>
      </div>

	
	<div align="right">
		<a href="List?page=${nowPage }">목록으로</a>
		<a href="ModifyForm?id=${dto.notice_id }&page=${nowPage}">수정</a>
		<a href="DeleteForm?id=${dto.notice_id }&oage=${nowPage}">삭제</a>
	</div>
  
  </div>