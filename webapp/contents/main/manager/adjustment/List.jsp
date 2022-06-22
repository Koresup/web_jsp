<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Calendar today = Calendar.getInstance();

	int first = today.get(Calendar.DAY_OF_WEEK);
	int year = today.get(Calendar.YEAR);
	int month = today.get(Calendar.MONTH)+1;
	int last = today.getActualMaximum(Calendar.DATE);
	
%>

<c:set var ="year" value = "<%=year %>"/>
<c:set var ="month" value = "<%=month%>"/>


<div class="container" >
    <main>
        <div class="row border-dark border-bottom" style="margin-bottom:20px">
        <h1>결제 현황</h1>
        </div>

        <div class="row">
          <div class="col text-center ">
            <a href="List"><button class="btn btn-primary">결제 현황</button></a>
            <a href="Annual?searchDate=2022"><button class="btn btn-primary">연간 정산</button></a>
<!--             <a href=""><button class="btn btn-primary">결제 현황</button></a> -->
<!--             <a href=""><button class="btn btn-primary">결제 현황</button></a> -->
<!--             <a href=""><button class="btn btn-primary">결제 현황</button></a> -->

          </div>

        </div>
        <div class="row" style="margin-top: 20px;">
            
            
            <div class="col">
                <table class="table table-hover">
                    <thead>
                      <tr>
                    <th class="col text-center"  style="width:80px" >번호</th>
                    <th class="col text-center"  style="width:165px">주문번호</th>
                    <th class="col text-center"  style="width:120px">종목</th>
                    <th class="col text-center" >주문 상품</th>
                    <th class="col text-center" style="width:200px" >사용일</th>
                    <th class="col text-center" style="width:100px" >ID</th>
                    <th class="col text-center" style="width:130px" >결제일</th>
                    <th class="col text-center" style="width:120px" >가격</th>
                    <th class="col text-center" style="width:100px" >상태</th>
                      </tr>
                    </thead>
                    <tbody>
						<c:forEach var ="dto" items="${mainData }" varStatus="no">
	                <tr>
	                  <td  class = "col text-center">
	                   ${ start + no.index+1}
	                  </td>
	                  <td class="col text-center" >
	                  	${dto.imp_uid }
	                  </td>
	                  <td class="col text-center" >
	                  	<c:choose>
							<c:when test = "${fn:contains(dto.id, 'gym_basketball')}">
								<c:set var = "type" value="../../gym/basketball/Detail?id=${dto.id }"/>
								농구 경기장
							</c:when>
							<c:when test = "${fn:contains(dto.id, 'gym_soccor')}">
							<c:set var = "type" value="../../gym/soccor/Detail?id=${dto.id }"/>
								축구 경기장
							</c:when>
							<c:when test = "${fn:contains(dto.id, 'lesson_bas')}">
							<c:set var = "type" value="../../lesson/bas/Detail?id=${dto.id }"/>
								농구 레슨
							</c:when>
							<c:otherwise>
							<c:set var = "type" value="../../gym/soc/Detail?id=${dto.id }"/>
								축구 레슨
							</c:otherwise>
						</c:choose>  
	                  </td>
	                  <td  class = "col text-center">
	                    ${dto.sname }
	                  </td>
	                  <td class = "col text-center"> 
	                  	${dto.resDate } <br />
						<c:if test="${fn:contains(dto.id, 'gym')}">
						<c:forTokens items ="${dto.resTime }"
							delims = "," var = "time" varStatus="no">
							${time*2 }시~${(time+1)*2  }시 
						</c:forTokens>
                  	</c:if>
	                  </td>
	                  <td  class = "col text-center">
	                    ${dto.user_id }
	                  </td>
	                  <td class="col text-center">
	                   <fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd HH:mm"/>
	                  </td>
	                  <td  class = "col text-center">
	                    ${dto.amount }원
	                  </td>
	                  <td  class = "col text-center">
	                    <c:choose>
	                    	<c:when test="${dto.refund_reg}">
	                    		<p class="text-danger">환불완료</p>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<p class="text-primary">결제완료</p>
	                    	</c:otherwise>
	                    </c:choose>
	                  </td>
	                  
	                </tr>
                		</c:forEach>
                    </tbody>
                    <tfoot>
                    	<tr><td class="paging" colspan="9">
                       <nav aria-label="Page navigation example">
                           <ul class="pagination justify-content-center">
                             <li class="page-item">
                            <c:if test="${pageStart > 1 }">
                            	 <a class="page-link"  href="<c:url value="List?page=${pageStart-1 }"/>">이전</a>
							</c:if>
                          	 </li>
						<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1"> 
							<c:choose>
								<c:when test="${nowPage == i }">
										<li class="page-item disabled">
											<a class="page-link" href="<c:url value="List?page=${i }"/>">${i }</a>
										</li>
								</c:when>		
								
								<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="<c:url value="List?page=${i }"/>">${i }</a>
								</li>
								</c:otherwise>		
							</c:choose>
						</c:forEach>
                             	<li class="page-item">
	                   			<c:if test="${pageEnd<pageTotal }">
	                                <a class="page-link" href="<c:url value="List?page=${pageEnd+1 }"/>">다음</a>
								</c:if>
							</li>
                           </ul>
                         </nav>
		                   </td>
		                   </tr>
                    
                    </tfoot>
                  </table>    
            </div>
      </div>
  </main>
</div>

