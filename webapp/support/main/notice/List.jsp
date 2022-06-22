<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<h1>공지사항</h1>


<form action="">
	<select name="filter" id="">
        <option value="전체">전체</option>
        <option value="서버">서버</option>
        <option value="대관">대관</option>
        <option value="수강">수강</option>
        <option value="게시판">게시판</option>
        <option value="공지">공지</option>
      </select> 
	
		<input type="text" name = "keyword"/>
	
	<input type="submit"  value="검색"/>
</form>

<table id = notice_table> 

	
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
	<tr>
<%-- 		<td>${ start + no.index+1}</td> --%>
		<td class = "notice_title">
			<a href="<c:url value="Detail?id=${dto.notice_id }&page=${nowPage }"/>">${dto.notice_title }</a>
		</td>
		<td class = "notice_filter">${dto.notice_filter }</td>
		<td  class = "notice_date">
		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/>
		</td>
	</tr>
	
	</c:forEach>
	<tr>
		<td colspan="5" align="center">
			<c:if test="${pageStart > 1 }">
				<a href="<c:url value="List?page=${pageStart-1 }"/>">[이전]</a>
			</c:if>
			<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage == i }">
							[${i }]
					</c:when>		
					
					<c:otherwise>
					<a href="<c:url value="List?page=${i }"/>">${i }</a>
					</c:otherwise>		
				</c:choose>
				
				
				
			</c:forEach>
			
			<c:if test="${pageEnd<pageTotal }">
			<a href="<c:url value="List?page=${pageEnd+1 }"/>">[다음]</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="5" align="right">
			<a href="<c:url value="InsertForm?page=${nowPage }"/>">글쓰기</a>
		</td>
	</tr>
</table>
