<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<div class="row border-dark border-bottom" style="margin-bottom:20px">
  <h1>예약 확인</h1>
  </div>
  <div class="container" style="width:800px">
    <main>
        <div class="container text-center border" >
          <div class="row"> 
            <div class="col text-center fs-2 fw-bold border-bottom" style="margin-top:20px; margin-bottom:30px; paddin-bottom:10px"> 주문 상세</div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  주문 상품
              </div>
              <div class="col-sm-6 fs-4">
                 ${dto.sname }
              </div>
          </div>

          <div class="row text-center" style="margin-bottom:20px">
  
            <div class="col-sm-4 fs-4 border-end border-dark">
                경기장 번호
            </div>
            <div class="col-sm-6 fs-4">
               <c:choose>
               	<c:when test="${dataType == \"lesson\" }">
               		${dto.post_id }
               	</c:when>
               	<c:otherwise>
	               ${dto.id }
               	</c:otherwise>
               </c:choose>
               
            </div>
        </div>

        <div class="row text-center" style="margin-bottom:20px">
  
          <div class="col-sm-4 fs-4 border-end border-dark">
              선택 날짜
          </div>
          <div class="col-sm-6 fs-4">
             ${dateSet }
          </div>
      </div>

      <div class="row text-center" style="margin-bottom:20px">
  
        <div class="col-sm-4 fs-4 border-end border-dark">
            사용 시간
        </div>
        <div class="col-sm-6 fs-4">
           <c:forEach var="time" items="${timeSelect }" varStatus="no">
			${time*2 }시~${(time+1)*2  }시 <br />
			</c:forEach>
        </div>
    </div>

    <div class="row text-center" style="margin-bottom:20px">
  
      <div class="col-sm-4 fs-4 border-end border-dark">
          결제 금액
      </div>
      <div class="col-sm-6 fs-4">
         ${totalPrice }원
      </div>
  </div>

  <div class="row text-center" style="margin-bottom:20px">
  
    <div class="col-sm-4 fs-4 border-end border-dark">
        주소
    </div>
    <div class="col-sm-6 fs-4">
       ${dto.address} <br /> ${dto.address_detail}
    </div>
</div>

<div class="row text-center">
  <div class="col">
    <a href="<c:url value="/index.jsp"/>"><button class="btn btn-primary btn-lg" >취소</button></a>
    <button class="btn btn-primary btn-lg" onclick="requestPay()">결제하기</button>

  </div>
  
</div>
          

        </div>
  </main>
</div>

<!-- <table border =""> -->
<!-- 	<tr> -->
<!-- 		<th>경기장</th> -->
<%-- 		<td>${dto.sname }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>경기장 번호</th> -->
<%-- 		<td>${dto.id }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>날짜</th> -->
<%-- 		<td>${dateSet }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>시간</th> -->
<%-- 		<td>${dateSet }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>사용 시간</th> -->
<!-- 		<td> -->
<%-- 			<c:forEach var="time" items="${timeSelect }" varStatus="no"> --%>
<%-- 			${time*2 }시~${(time+1)*2  }시 <br /> --%>
<%-- 			</c:forEach> --%>
		
			
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>price</th> -->
<%-- 		<td>${totalPrice }원</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>주소</th> -->
<%-- 		<td>${dto.address} , ${dto.address_detail} <br /> --%>
<%-- 		<a href="https://map.kakao.com/link/to/${dto.sname },33.450701,126.570667" style="color:blue" target="_blank">길찾기</a> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>매니저</th> -->
<%-- 		<td>${dto.manager_id }</td> --%>
<!-- 	</tr> -->

<!-- 	<tr> -->
<!-- 		<td colspan = "2"> -->
<%-- 			<a href="<c:url value="Detail?id=${dto.id }&page=${nowPage }&dateSet=${dateSet }"/>">취소</a> --%>
<!-- 			 <button onclick="requestPay()">결제하기</button> -->
<!-- 		</td> -->
<!-- 	</tr> -->

<!-- </table> -->

<script>
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp36141974");
    function requestPay() {
    	
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: 'merchant_'+new Date().getTime(),
          name: "${dto.sname}",
//           amount: ${totalPrice},
          amount: 100,
          buyer_email: "${User.email}",
          buyer_name: "${User.pName}",
          buyer_tel: "${User.phoneNum}",
          buyer_addr: "${User.address}"
      }, function (rsp) { // callback
          if (rsp.success) {
              alert("결제 성공")
        			  
        	  var form = document.createElement('form');
              form.setAttribute('method', 'post');
              form.setAttribute('action', 'ReservationReg');
              document.charset = "UTF-8";
			 
			 var params = {
				 imp_uid : rsp.imp_uid,
				 id : '${dto.id}',
				 price : '${totalPrice}',
				 dateSet : '${dateSet}',
				 selectTime : '${timeSelect}',
				 user_id : '${User.pid}',
				 sname : '${dto.sname}',
				 manager_id : '${dto.manager_id}'
			 };
			 
              for (var key in params) {
                var hiddenField = document.createElement('input');
                hiddenField.setAttribute('type', 'hidden');
                hiddenField.setAttribute('name', key);
                hiddenField.setAttribute('value', params[key]);
                form.appendChild(hiddenField);
              }

              document.body.appendChild(form);
              form.submit();
            
          }
      });
    }
  </script>