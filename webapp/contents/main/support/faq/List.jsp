<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>


<div id = "main_wrap">
	<div class="row border-dark border-bottom" style="margin-bottom:30px">
			<h1>FAQ</h1>
	</div>
	
<c:if test="${User.grade == 1 }">
	<div class="row">
		<div class="col text-end" style="margin-bottom:10px">
            	<a href="<c:url value="InsertForm?page=${nowPage }"/>"><button type="button" class="btn btn-outline-secondary">새글쓰기</button></a>
            </div>
	</div>
</c:if>
	
	<div class="accordion" id="accordionExample">
		<c:forEach var="dto" items="${mainData }" varStatus="no">
		<div class ="row" style="margin-bottom:5px">
			<div class ="col">
			    <div class="accordion-item">
			      <h2 class="accordion-header" id="${onetwo[no.index] }">
			        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="${onetwoColshop[no.index] }" aria-expanded="false" aria-controls="${onetwoCol[no.index]}">
			        <font class = " fs-5 fw-bold" style="vertical-align: inherit;">
			         	${dto.questionBr }
			        </font>
			        </button>
			      </h2>
			      <div id="${onetwoCol[no.index] }" class="accordion-collapse collapse" aria-labelledby="${onetwo[no.index]}" data-bs-parent="#accordionExample" style="">
			        <div class="accordion-body">
			          <font style="vertical-align: inherit;">
			          		${dto.answerBr }
			      	  </font>
			          </div>
			      </div>
			    </div>
		    </div>
		    <c:if test="${User.grade==1 }">
			    <div class ="col" style="width:150px; display:contents; margin-left:5px">
			        <a href="ModifyForm?id=${dto.id }&page=${nowPage}" style="margin-right:5px"><button type="button" class="btn btn-light">수정</button></a>
			        <a href="DeleteForm?id=${dto.id }&oage=${nowPage}"><button type="button" class="btn btn-secondary">삭제</button></a>
			    </div>
		    </c:if>
    </div>
    </c:forEach>
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
  </div>
</div>
<!--   <div id = "faq_section"> -->
  
<%--   	<c:forEach var="dto" items="${mainData }" varStatus="no"> --%>
  	
<!--   	<div class = "faq_btn"> -->
<!--       <div> -->
<%--         <a href="ModifyForm?id=${dto.id }&page=${nowPage}">수정</a> --%>
<!--       </div> -->
<!--       <div> -->
<%--           <a href="DeleteForm?id=${dto.id }&oage=${nowPage}">삭제</a> --%>
<!--       </div> -->
<!--     </div> -->
    
<!--     <div class = "faq_data"> -->
<!--       <div class = "faq_question"> -->
<%--         ${dto.question } --%>
<!--       </div> -->
<!--       <div class = "faq_answer"> -->
<%--         ${dto.answer } --%>
<!--       </div> -->
<!--     </div> -->
    
<%-- 	</c:forEach> --%>
<!--   </div> -->
  
<!--   <div id = "faq_page"> -->
<%--       <c:if test="${pageStart > 1 }"> --%>
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
<!--     </div> -->
    
<!--     <div id = "newFAQ"> -->
<%--     	<a href="<c:url value="InsertForm?page=${nowPage }"/>">글쓰기</a> --%>
<!--     </div> -->
