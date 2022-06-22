<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<div class="row border-dark border-bottom" style="margin-bottom:30px">
	<h1>공지사항</h1>
</div>
  <div class="row">
  	<div class ="col" style="margin-bottom:10px">
		<a href="List?page=${nowPage }"><button type="button" class="btn btn-outline-secondary"> 목록으로</button></a>
  	</div>
  	
  	<c:if test="${User.grade==1 }">
	  	<div class ="col sm-4 text-end">
	  		<a href="ModifyForm?id=${dto.id }&page=${nowPage}"><button type="button" class="btn btn-outline-secondary"> 수정</button></a>
	  		<a href="DeleteForm?id=${dto.id }&page=${nowPage}"><button type="button" class="btn btn-outline-secondary"> 삭제</button></a>
	  	</div>
  	</c:if>
  </div>
  <div class="container border border-3 rounded">
          <div class="row">
            <p class=" fs-3 fw-bold">${dto.title }</p>
          </div>
          <div class="row border-bottom">
            <div class="col" style="margin-left : 20px">
              <p class="fs-6 text-primary fw-bold" >${dto.filter }</p>
            </div>
            <div class="col sm-1 " style="margin-right:20px">
              <p class="text-end fs-6 text-muted">  <fmt:formatDate value="${dto.reg_date }" pattern="yyyy.MM.dd"/></p>
            </div>
          </div>
           <div class="row" style="padding:10px" >
            <p class=" fs-4">${dto.contentBr }</p>
          </div>
          
      </div>

