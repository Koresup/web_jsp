<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h1>환불띠</h1>


<div class="row border-dark border-bottom" style="margin-bottom:20px">
  <h1>환불 결과</h1>
  </div>
  <div class="container" style="width:800px">
    <main>
        <div class="container text-center border" >
          <div class="row"> 
            <div class="col text-center fs-2 fw-bold border-bottom" style="margin-top:20px; margin-bottom:30px; paddin-bottom:10px">${msg }</div>
          </div>
          
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  주문번호
              </div>
              <div class="col-sm-6 fs-4">
                 ${data.imp_uid }
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  결제 금액
              </div>
              <div class="col-sm-6 fs-4">
                 ${data.amount }원
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  주문자
              </div>
              <div class="col-sm-6 fs-4">
                 ${data.buyer_name }
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  상품 번호
              </div>
              <div class="col-sm-6 fs-4">
                 ${data.merchant_uid }
              </div>
          </div>

          <div class="row text-center" style="margin-bottom:20px">
  
            <div class="col-sm-4 fs-4 border-end border-dark">
                상품 이름
            </div>
            <div class="col-sm-6 fs-4">
               ${data.sname }
            </div>
        </div>

        <div class="row text-center" style="margin-bottom:20px">
  
          <div class="col-sm-4 fs-4 border-end border-dark">
              예약 날짜
          </div>
          <div class="col-sm-6 fs-4">
             ${data.resDate }
          </div>
      </div>
      

      <div class="row text-center" style="margin-bottom:20px">
  
        <div class="col-sm-4 fs-4 border-end border-dark">
            예약 시간
        </div>
        <div class="col-sm-6 fs-4">
        	<c:if test="${fn:contains(data.id, 'gym')}">
				<c:forTokens items ="${data.resTime }"
					delims = "," var = "time" varStatus="no">
					${time*2 }시~${(time+1)*2  }시 
				</c:forTokens>
            </c:if>
        </div>
    </div>

    <div class="row text-center" style="margin-bottom:20px">
  
      <div class="col-sm-4 fs-4 border-end border-dark">
          유저 아이디
      </div>
      <div class="col-sm-6 fs-4">
         ${data.user_id }
      </div>
  </div>
  	<div class="row text-center" style="margin-bottom:20px">
  
      <div class="col-sm-4 fs-4 border-end border-dark">
          환불상태
      </div>
      <div class="col-sm-6 fs-4">
         <c:choose>
        		<c:when test="${data.refund_reg }">
        			환불 완료
        		</c:when>
        		<c:otherwise>
        			환불 실패
        		</c:otherwise>
        	</c:choose>
	      </div>
	  </div>
        </div>
  </main>
  <div class="row text-center"> 
	<a href="<c:url value="/index.jsp"/>"><button type = "button"class="btn btn-outline-primary">홈으로</button></a>
  </div>
</div>



<!-- <h3></h3> -->

<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<td>주문번호</td> -->
<%-- 		<td>${data.imp_uid }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>결제 금액</td> -->
<%-- 		<td>${data.amount }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>결제자</td> -->
<%-- 		<td>${data.buyer_name }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>상품 번호</td> -->
<%-- 		<td>${data.merchant_uid }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>경기장 이름</td> -->
<%-- 		<td>${data.sname }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>예약 날짜</td> -->
<%-- 		<td>${data.resDate }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>예약 시간</td> -->
<!-- 		<td> -->
<%-- 		<c:forTokens items ="${data.resTime }"	delims = "," var = "time" varStatus="no"> --%>
<%-- 				${time*2 }시~${(time+1)*2  }시  --%>
<%-- 		</c:forTokens> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>유저 아이디</td> -->
<%-- 		<td>${data.user_id }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>환불 상태</td> -->
<%-- 		<td>${data.refund_reg }</td> --%>
<!-- 	</tr> -->
	
<!-- </table> -->
