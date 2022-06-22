<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Calendar today = Calendar.getInstance();

	int first = today.get(Calendar.DAY_OF_WEEK);
	int year = today.get(Calendar.YEAR);
	int month = today.get(Calendar.MONTH)+1;
	int last = today.getActualMaximum(Calendar.DATE);
	
%>

<h1>정산 페이지</h1>
<h2>검색 결과</h2>

<c:set var ="year" value = "<%=year %>"/>
<c:set var ="month" value = "<%=month%>"/>

<form action="">
	<select name="filter_year" id="">
        <option value="">--연도--</option>
        <c:forEach var = "data" begin="0" end="4" step="1" varStatus="no">
        	<option value="${year-data}"  <c:if test="${param.filter_year == (year-data)}">selected</c:if> >${year-data}년</option>
        </c:forEach>
      </select> 
      
      <select name="filter_month" id="">
        <option value="">--월--</option>
        <c:forEach var = "data" begin="1" end="12" step="1">
        	<option value="${data}" <c:if test="${param.filter_month == data}">selected</c:if> >${data}월</option>
        </c:forEach>
      </select> 
      
      <select name="filter_manager" id="">
        <option value="">--계약자--</option>
        <c:forEach var = "data" items="${manager }" >
        	<option value="${data}" <c:if test="${param.filter_manager == data}">selected</c:if>>${data}</option>
        </c:forEach>
      </select> 
      
      <input type="submit"  value="검색"/>
</form>


<table border = "" align = "center">
	<tr>
		<th>주문번호</th>
		<th>이용고객</th>
		<th>경기장</th>
		<th>사용일</th>
		<th>결제금액</th>
		<th>결제일</th>
		<th>환불내역</th>
	</tr>
	
	<c:forEach var = "dto" items="${mainData }">
	<tr>
		<td>${dto.imp_uid }</td>
		<td>${dto.buyer_name }</td>
		<td>${dto.sname }</td>
		<td>${dto.resDate }</td>
		<td>${dto.amount }</td>
		<td>${dto.reg_date }</td>
		<td>
			<c:if test="${dto.refund_reg}">환불</c:if>
		</td>
	</tr>
	</c:forEach>
</table>

<h3>정산 금액 : ${tot }원</h3>
<a href="MainPage">돌아가기</a>
