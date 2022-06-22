<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="row border-dark border-bottom" style="margin-bottom:20px">
        <h1>Q&A</h1>
    </div>

      <div class="row">
     	 <c:if test="${User!=null && User.grade!=1}">
	        <div class ="col" style="margin-bottom:10px">
	        	<a href="MyQuestion?page=${nowPage }"><button type="button" class="btn btn-outline-secondary"> 뒤로</button></a>
	        </div>
        </c:if>
        <c:if test="${dto.answer == null && User.grade!=1 }">
        <div class ="col sm-4 text-end">
          <a href="ModifyForm?id=${dto.id }&page=${nowPage}"><button type="button" class="btn btn-outline-secondary"> 수정</button></a>
          <a href="DeleteForm?id=${dto.id }&page=${nowPage}"><button type="button" class="btn btn-outline-secondary"> 삭제</button></a>
        </div>
        </c:if>
      </div>

      <div class="container border border-3 rounded">
        <div class="row">
          <p class=" fs-3 fw-bold pe-none ">${dto.title }</p>
        </div>
        <div class="row ">
          <div class="col pe-none" style="">
            작성자 : ${dto.user_id }
           </div>
           <div class="col sm-1">
           	<c:choose>
				<c:when test="${dto.answer != null }"> 
					<p class="text-end fs-6 text-primary fw-bold pe-none">  답변완료</p>
				</c:when>
				<c:otherwise>
					<p class="text-end fs-6 text-danger fw-bold pe-none">  미답변</p>
				</c:otherwise>
			</c:choose>
          </div>
        </div>
        
        
        <div class="row border-bottom" style="padding-bottom:10px; margin-bottom:10px">
          <div class="col " style="botton-left:10px">
            <p class="text-primary fw-bold pe-none">${dto.filter }</p> 
          </div>
          <div class="col sm-1">
          	<p class="text-end fs-6 text-muted pe-none">  <fmt:formatDate value="${dto.reg_date }" pattern="yyyy.MM.dd HH:mm"/></p>
          </div>
        </div>
        <div class="row" style="padding-bottom: 10px; margin-bottom: 20px">
          <p class=" fs-5 pe-none">${dto.questionBr }</p>
        </div>
    </div>
    
    <c:choose>
    	<c:when test ="${User.grade == 1 }">
			<div class="container border border-3 rounded" style="margin-top: 15px;">
				<c:choose>
					<c:when test="${dto.answer == null }">
					        <div class="mb-3 row">
					          <form action="InsertAnswer" method = "post">
					         	 <input type="hidden" name="id" value="${dto.id }" />
								<input type="hidden" name="user_id" value="${dto.user_id }" />	
					            <div class="row">
					              <label for="content" class="col-sm-2 col-form-label fs-3 text-center fw-bold" >Answer</label>
					              <div class="col-sm-10">
					                  <textarea class="form-control" id="content" name = "answer" rows="15" placeholder="답변을 입력해 주세요" required></textarea>
					              </div>
					            </div>
					            <div class="row">
					                <div class="col text-end" style="margin-top: 10px;">
					                  <button type="submit" class="btn btn-outline-secondary" style="margin-right:10px">답변 입력</button>
					                </div>
					
					            </div>
					          </form>
					        </div> 
					</c:when>
					<c:otherwise>
				       <div class="mb-3 row">
				          <div class="row">
				            <p class="fs-3 fw-bold pe-none">Answer</p>
				          </div>
				          <div class="row">
				            <p class="fs-5 pe-none">${dto.answerBr }</p>
				          </div>
				          <div class="row">
				            <div class="col sm-1">
				            <p class="text-end fs-6 text-muted pe-none">  <fmt:formatDate value="${dto.reg_date_answer }" pattern="yyyy.MM.dd HH:mm"/></p>
				            </div>
				          </div>
				      </div>
					</c:otherwise>
				</c:choose>
			</div>	
    	
    	</c:when>
    	
    	<c:otherwise>
    		<c:if test="${dto.answer != null }">
	    		<div class="container border border-3 rounded" style="margin-top: 15px;">
	    			 <div class="mb-3 row">
				          <div class="row">
				            <p class="fs-3 fw-bold pe-none">Answer</p>
				          </div>
				          <div class="row">
				            <p class="fs-5 pe-none">${dto.answer }</p>
				          </div>
				          <div class="row">
				            <div class="col sm-1">
				            <p class="text-end fs-6 text-muted pe-none">  <fmt:formatDate value="${dto.reg_date_answer }" pattern="yyyy.MM.dd HH:mm"/></p>
				            </div>
				          </div>
				      </div>
	    		</div>
    		</c:if>
    	</c:otherwise>
    </c:choose>
    
	
	
	<c:if test="${User.grade == 1 }">
	
	<div class="row">
		<div class ="col text-end" style="margin-top:20px;">
			<a href="List?page=${nowPage }"><button type="button" class="btn btn-outline-secondary"> 목록으로</button></a>
		</div>
	</div>
</c:if>



