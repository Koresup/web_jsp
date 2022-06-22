<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row border-dark border-bottom pe-none" style="margin-bottom:10px">
	<h1>Q & A</h1>
</div>
<div class="row" style="margin-bottom:30px">
    <div class="col">
      <p class="fs-4 fw-bold pe-none">고객의 말씀</p>
      <p class="fs-6 text-muted pe-none"> - 저희 서비스를 이용하시면서 겪으신 불편사항, 건전한 제언, 칭송 및 문의 사항을 남겨주세요.</p>  
      <p  class="fs-6 text-muted pe-none"> - 불편사항은 공정거래위원회 고시 소비자분쟁해결기준에 따라 처리함을 원칙으로 하고 있습니다.</p>
    </div>
  </div>

  <div class="row" style="margin-bottom:40px">
    <div class="col">
      <p class="fs-5 fw-bold pe-none">관련 링크</p>
		<div class="row">
			<div class="col-sm-3 fs-5 fw-bold" >
		      <a href="<c:url value="/support/notice/List"/>">공지사항</a>
			</div>
			<div class="col-sm-3 fs-5 fw-bold" >
		      <a href="<c:url value="/support/faq/List"/>">자주 묻는 질문</a>
			</div>
		
		</div>
    </div>
  </div>

  <div class="row" style="margin-bottom:40px">
    <div class="col">
      <p class="fs-5 fw-bold pe-none">[유의사항]</p>
      <p class="fs-6 text-muted pe-none"> - 욕설이나 폭언, 성희롱, 근거 없는 음해, 기타 타인의 인격을 모욕하거나 명예를 훼손하는 표현이 포함되거나 당사와 무관한 사안의 경우 사전예고 없이 접수 제외 처리될 수 있음을 알려드립니다.</p>  
      <p  class="fs-6 text-muted pe-none"> - 고객님께서 제공하는 정보는 개인정보 보호 절차에 따라 철저히 관리됩니다. 다만, 계좌정보 등 중요한 개인정보 기재는 당사가 별도로 요청한 경우 외에는 지양하여 주시기 바랍니다.</p>
    </div>
  </div>

  <div class="row" style="margin-top: 10px;">
    <div class="col text-center">
    	<c:choose>
    		<c:when test="${User.grade ==1 }">
    			<a href="List"><button type="button" class="btn btn-outline-primary fs-3"> 고객의 말씀 리스트</button></a>
    		</c:when>
    		
    		<c:otherwise>
    			<a href="MyQuestion"><button type="button" class="btn btn-outline-primary fs-3"> 작성한 글 확인</button></a>
  				<a href="InsertForm"><button type="button" class="btn btn-primary fs-3"> 고객의 말씀 작성</button></a>
    		</c:otherwise>
    	</c:choose>
  		
    </div>
  </div>

