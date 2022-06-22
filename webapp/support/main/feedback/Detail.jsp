<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1>고객 말씀</h1>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table>
	<tr>
		<td>제목</td>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<td>분류</td>
		<td>${dto.filter }</td>
	</tr>
	<tr>
		<td>본문</td>
		<td>${dto.question }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${dto.user_id }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${dto.reg_date }</td>
	</tr>
</table>

<br />
<c:choose>
	<c:when test="${dto.answer != null }">

---------- 답변 ----------------- <br />
<table>
	<tr>
		<td>본문</td>
		<td>${dto.answer }</td>	
	</tr>
	<tr>
		<td>답변일</td>
		<td>${dto.reg_date_answer }</td>	
	</tr>
</table>
<br />
	</c:when>

	<c:otherwise>
		<form action="InsertAnswer" method = "post">
		<input type="hidden" name="id" value="${dto.id }" />
		<input type="hidden" name="user_id" value="${dto.user_id }" />
		<textarea name="answer" id="" cols="30" rows="10"></textarea>
		
		<input type="submit" value="답변입력" />
		</form>
	</c:otherwise>
	
	</c:choose>
<a href="List?page=${nowPage }">목록으로</a> <br />

<a href="MyQuestion?user_id=${dto.user_id }&page=${nowPage }">뒤로</a>
<a href="ModifyForm?id=${dto.id }&page=${nowPage}">수정</a>
<a href="DeleteForm?id=${dto.id }&page=${nowPage}">삭제</a>


