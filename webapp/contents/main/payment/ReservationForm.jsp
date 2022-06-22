<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%-- <h1>예약 확인</h1>
<c:choose>
	<c:when test="${dataType == \"lesson\" }">
		<c:set var="pid" value = "${dto.post_id }"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="pid" value = "${dto.id }"></c:set>
	</c:otherwise>							
</c:choose> --%>


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
               	<c:when test="${dataType == \"gym\" }">
	               ${dto.id }
               	</c:when>
               	<c:otherwise>
               		${dto.post_id }
               	</c:otherwise>
               </c:choose>
            </div>
        </div>

	<c:choose>
		<c:when test="${dateType == \"gym\" }">
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
		</c:when>
		<c:otherwise>
			<div class="row text-center" style="margin-bottom:20px">
	          <div class="col-sm-4 fs-4 border-end border-dark">
	              카테고리
	          </div>
	          <div class="col-sm-6 fs-4">
	             ${dto.category }
	          </div>
      		</div>
      		<div class="row text-center" style="margin-bottom:20px">
	          <div class="col-sm-4 fs-4 border-end border-dark">
	              시간
	          </div>
	          <div class="col-sm-6 fs-4">
	             ${dto.lesson_time }
	          </div>
      		</div>
      		
      		<div class="row text-center" style="margin-bottom:20px">
	          <div class="col-sm-4 fs-4 border-end border-dark">
	              결제 금액
	          </div>
	          <div class="col-sm-6 fs-4">
	             ${dto.price }원
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
			    <button class="btn btn-primary btn-lg" onclick="requestPayLesson()">결제하기</button>
		  </div>
			</div>
		</c:otherwise>
	</c:choose>
        </div>
  </main>
</div>

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
				 id : '${pid}',
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
    
    function requestPayLesson() {
    	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: 'merchant_'+new Date().getTime(),
            name: "${dto.sname}",
//             amount: ${totalPrice},
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
  				 id : '${pid}',
  				 price : '${dto.price}',
  				 dateSet : '${dto.lesson_time}',
  				 selectTime : '${dto.lesson_time}',
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