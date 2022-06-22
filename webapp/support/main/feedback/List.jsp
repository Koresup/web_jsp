<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>고객말씀</h1>

<table id = notice_table>
	<tr>
		<th>번호</th>
		<th>구분</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
	<tr>
		<td>${ start + no.index+1}</td>
		<td class = "notice_filter">${dto.filter }</td>
		<td class = "notice_title">
			<a href="<c:url value="Detail?id=${dto.id }&page=${nowPage }"/>">${dto.title }</a>
		</td>
		<td >
			${dto.user_id }
		</td>
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
</table>

<a href="home">홈으로</a>
