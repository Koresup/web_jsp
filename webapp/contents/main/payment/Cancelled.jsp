<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row border-dark border-bottom" style="margin-bottom:20px">
  <h1>환불하시겠습니까?</h1>
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
                 ${dto.imp_uid }
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  결제 금액
              </div>
              <div class="col-sm-6 fs-4">
                 ${dto.amount }원
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  주문자
              </div>
              <div class="col-sm-6 fs-4">
                 ${dto.buyer_name }
              </div>
          </div>
          <div class="row text-center" style="margin-bottom:20px">
  
              <div class="col-sm-4 fs-4 border-end border-dark">
                  상품 번호
              </div>
              <div class="col-sm-6 fs-4">
                 ${dto.merchant_uid }
              </div>
          </div>

          <div class="row text-center" style="margin-bottom:20px">
  
            <div class="col-sm-4 fs-4 border-end border-dark">
                상품 이름
            </div>
            <div class="col-sm-6 fs-4">
               ${dto.sname }
            </div>
        </div>

        <div class="row text-center" style="margin-bottom:20px">
  
          <div class="col-sm-4 fs-4 border-end border-dark">
              예약 날짜
          </div>
          <div class="col-sm-6 fs-4">
             ${dto.resDate }
          </div>
      </div>
      

      <div class="row text-center" style="margin-bottom:20px">
  
        <div class="col-sm-4 fs-4 border-end border-dark">
            예약 시간
        </div>
        <div class="col-sm-6 fs-4">
        	<c:if test="${fn:contains(dto.id, 'gym')}">
				<c:forTokens items ="${dto.resTime }"
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
         ${dto.user_id }
      </div>
  </div>
        </div>
  </main>
  <div class="row text-center"> 
  <form action="CancelledReg" method="post">
	<input type="hidden" name = "imp_uid" value="${dto.imp_uid }" />
	<a href="<c:url value="/index.jsp"/>"><button type = "button"class="btn btn-outline-primary">돌아가기</button></a>
	<button type = "submit"class="btn btn-outline-danger">환불하기</button>
	</form>
  </div>
</div>



