<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row border-dark border-bottom" style="margin-bottom:20px">
  <h1>결제 완료</h1>
  </div>
  <div class="container" style="width:800px">
    <main>
        <div class="container text-center border" >
          <div class="row"> 
            <div class="col text-center fs-2 fw-bold border-bottom" style="margin-top:20px; margin-bottom:30px; paddin-bottom:10px"> 주문 상세</div>
          </div>
          
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  주문번호
              </div>
              <div class="col-sm-6 fs-4">
                 ${paymentResult.imp_uid }
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  결제 금액
              </div>
              <div class="col-sm-6 fs-4">
                 ${paymentResult.amount }원
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  주문자
              </div>
              <div class="col-sm-6 fs-4">
                 ${paymentResult.buyer_name }
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  상품 번호
              </div>
              <div class="col-sm-6 fs-4">
                 ${paymentResult.merchant_uid }
              </div>
          </div>

          <div class="row text-center" style="margin-bottom:20px">
  
            <div class="col-sm-4 fs-4 border-end border-dark">
                상품 이름
            </div>
            <div class="col-sm-6 fs-4">
               ${paymentResult.sname }
            </div>
        </div>

        <div class="row text-center" style="margin-bottom:20px">
  
          <div class="col-sm-4 fs-4 border-end border-dark">
              예약 날짜
          </div>
          <div class="col-sm-6 fs-4">
             ${paymentResult.resDate }
          </div>
      </div>
      

      <div class="row text-center" style="margin-bottom:20px">
  
        <div class="col-sm-4 fs-4 border-end border-dark">
            예약 시간
        </div>
        <div class="col-sm-6 fs-4">
           <c:forTokens items ="${paymentResult.resTime }"	delims = "," var = "time" varStatus="no">
				${time*2 }시~${(time+1)*2  }시 
		</c:forTokens>
        </div>
    </div>

    <div class="row text-center" style="margin-bottom:20px">
  
      <div class="col-sm-4 fs-4 border-end border-dark">
          유저 아이디
      </div>
      <div class="col-sm-6 fs-4">
         ${paymentResult.user_id }
      </div>
  </div>
        </div>
  </main>
</div>

<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<td>주문번호</td> -->
<%-- 		<td>${paymentResult.imp_uid }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>결제 금액</td> -->
<%-- 		<td>${paymentResult.amount }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>결제자</td> -->
<%-- 		<td>${paymentResult.buyer_name }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>상품 번호</td> -->
<%-- 		<td>${paymentResult.merchant_uid }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>경기장 이름</td> -->
<%-- 		<td>${paymentResult.sname }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>예약 날짜</td> -->
<%-- 		<td>${paymentResult.resDate }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>예약 시간</td> -->
<!-- 		<td> -->
<%-- 		<c:forTokens items ="${paymentResult.resTime }"	delims = "," var = "time" varStatus="no"> --%>
<%-- 				${time*2 }시~${(time+1)*2  }시  --%>
<%-- 		</c:forTokens> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>유저 아이디</td> -->
<%-- 		<td>${paymentResult.user_id }</td> --%>
<!-- 	</tr> -->
	
<!-- </table> -->
<a href="List">목록으로</a>