<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
<c:set var = "type" value="gym"/>

<c:set var = "todayDate" value="<%=new Date() %>"/>

<fmt:formatDate var ="today" value="${todayDate }" pattern="yyyy-MM-dd"/>

<div class="container">
    <main>
        <div class="row border-dark border-bottom" style="margin-bottom:20px">
        <h1>대관 내역</h1>
        </div>
        <div class="row">
            <jsp:include page="../sideMenu.jsp"/>

            <div class="col">
                <table class="table table-hover">
                    <thead>
                      <tr>
	                    <th class="col text-center"  style="width:120px">종목</th>
	                    <th class="col text-center" style="width:130px" >신청일</th>
	                    <th class="col text-center" style="width:200px" >사용일</th>
	                    <th class="col text-center" style="width:230px" >장소</th>
	                    <th class="col text-center" style="width:120px" >가격</th>
	                    <th class="col text-center" style="width:100px" >상태</th>
	                    <th class="col text-center"  >환불여부</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dto" items="${mainData }" varStatus="no">
                <tr>
                  <td class="col text-center" >
						<c:choose>
							<c:when test = "${fn:contains(dto.id, 'gym_basketball')}">
								<c:set var = "type" value="../../gym/basketball/Detail?id=${dto.id }"/>
								농구 경기장
							</c:when>
							<c:when test = "${fn:contains(dto.id, 'gym_soccer')}">
							<c:set var = "type" value="../../gym/soccer/Detail?id=${dto.id }"/>
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
                  <td class="col text-center">
                  	<fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd"/>
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
                    <a href="<c:url value="${type }"/>">${dto.sname }</a>
                  </td>
                  <td  class = "col text-center">
                    ${dto.amount }원
                  </td>
                  <td  class = "col text-center">
                  	<c:choose>
                  		<c:when test="${today > dto.resDate }">
                  			사용
                  		</c:when>
                  		<c:otherwise>
                  			미사용
                  		</c:otherwise>
                  	</c:choose>
                  </td>
                  <td  class = "col text-center">
                    <c:choose>
                  		<c:when test="${today < dto.resDate && !dto.refund_reg}">
                  			<button onclick="paymentCancelled('${dto.imp_uid}')">환불하기</button>
                  		</c:when>
                  		<c:otherwise>
                  			<c:choose>
                  				<c:when test="${dto.refund_reg }">
                  					환불 <br /> 완료
                  				</c:when>
                  				<c:otherwise>
                  					환불 <br /> 불가
                  				</c:otherwise>
                  			</c:choose>
                  		</c:otherwise>
                  	</c:choose>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
                   <tfoot>
                   <tr><td class="paging" colspan="7">
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
                   </td></tr>
               </tfoot>
                  </table>    
            </div>
      </div>
  </main>
</div>



<!-- <table border=""> -->
<!-- 	<tr> -->
<!-- 		<th>종목</th> -->
<!-- 		<th>신청일</th> -->
<!-- 		<th>사용일</th> -->
<!-- 		<th>장소</th> -->
<!-- 		<th>가격</th> -->
<!-- 		<th>상태</th> -->
<!-- 	</tr> -->
	
<%-- 	<c:forEach var="dto" items="${mainData }" varStatus="no"> --%>
		
<!-- 	<tr> -->
<!-- 		<td> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test = "${fn:contains(dto.id, 'gym_basketball')}"> --%>
<%-- 					<c:set var = "type" value="../../gym/basketball/Detail?id=${dto.id }"/> --%>
<!-- 					농구 경기장 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test = "${fn:contains(dto.id, 'gym_soccor')}"> --%>
<%-- 				<c:set var = "type" value="../../gym/soccor/Detail?id=${dto.id }"/> --%>
<!-- 					축구 경기장 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test = "${fn:contains(dto.id, 'lesson_bas')}"> --%>
<%-- 				<c:set var = "type" value="../../lesson/bas/Detail?id=${dto.id }"/> --%>
<!-- 					농구 레슨 -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 				<c:set var = "type" value="../../gym/soc/Detail?id=${dto.id }"/> --%>
<!-- 					축구 레슨 -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 		</td> -->
<!-- 		<td> -->
<%-- 		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/> --%>
<!-- 		</td> -->
<!-- 		<td> -->
<%-- 			${dto.resDate } <br /> --%>
<%-- 			<c:forTokens items ="${dto.resTime }" --%>
<%-- 				delims = "," var = "time" varStatus="no"> --%>
<%-- 				${time*2 }시~${(time+1)*2  }시  --%>
<%-- 			</c:forTokens> --%>
<!-- 		</td> -->
<%-- 		<td><a href="<c:url value="${type }"/>">${dto.sname }</a></td> --%>
<%-- 		<td>${dto.amount }</td> --%>
<!-- 		<td> -->
<!-- 			사용 -->
<!-- 		</td> -->
<!-- 		<td> -->
<%-- 			<button onclick="paymentCancelled('${dto.imp_uid}')">환불하기</button> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
	
<%-- 	</c:forEach> --%>
<!-- 	<tr> -->
<!-- 		<td colspan="5" align="center"> -->
<%-- 			<c:if test="${pageStart > 1 }"> --%>
<%-- 				<a href="<c:url value="List?page=${pageStart-1 }"/>">[이전]</a> --%>
<%-- 			</c:if> --%>
<%-- 			<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${nowPage == i }"> --%>
<%-- 							[${i }] --%>
<%-- 					</c:when>		 --%>
					
<%-- 					<c:otherwise> --%>
<%-- 					<a href="<c:url value="List?page=${i }"/>">${i }</a> --%>
<%-- 					</c:otherwise>		 --%>
<%-- 				</c:choose> --%>
				
				
				
<%-- 			</c:forEach> --%>
			
<%-- 			<c:if test="${pageEnd<pageTotal }"> --%>
<%-- 			<a href="<c:url value="List?page=${pageEnd+1 }"/>">[다음]</a> --%>
<%-- 			</c:if> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->

<script>
	function paymentCancelled(uid){
		alert(uid+'환불페이지로 이동합니다.')
		location.href = "../../payment/Cancelled?imp_uid="+uid
	}
</script>