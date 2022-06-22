<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<h1>FAQ</h1>

<style>
    div#faq_section{
      width:980px;
      margin:0px auto;
       position:relative;
      /* font-size: 30px; */
      margin-top: 5px;
    }

    div.faq_data{
      width: 90%;
      height: 38px;
      overflow: hidden;
      border-top: solid 1px black;
    }
    
	div.faq_btn{
      width:5%;
      position: absolute;
      right: 0px;
    }

    div.faq_btn div{
      font-size: 20px;
      margin-top: 5px;
    }
    
    div#faq_section>div:last-child{
      border-bottom: solid 1px black;
    }
    
    div.faq_question{
      font-size: 30px;
    }
    div.faq_answer{
      font-size: 25px;
      /* display : none; */
    }

	div#faq_page{
	width : 300px;
		margin: 0px auto;
		text-align:center;
	}
	
	div#newFAQ{
		float : right;
	}
  </style>
  
<script>

	document.addEventListener('DOMContentLoaded', ()=>{
		const questionList = document.querySelectorAll('.faq_data')
		

		let closeHeight = 40;
		let openHeight = 0;
		let selectedItem = null
		
		let questionHeight = 30;

		
		for(const item of questionList){
      item.addEventListener('click', questionClick)
		}
		

    
		function questionClick(){
			if(selectedItem != null && selectedItem != this){
				gsap.to(selectedItem, {height: selectedItem.children[0].clientHeight, duration: 0.3, ease:'power1.out'})
			}

      if(selectedItem != this){
        selectedItem = this;
        openHeight = selectedItem.children[0].clientHeight + selectedItem.children[1].clientHeight
        gsap.to(selectedItem, {height: openHeight, duration:0.3, ease:'power1.out'})

      }

		}
		
	})

</script>


  <div id = "faq_section">
  
  	<c:forEach var="dto" items="${mainData }" varStatus="no">
  	
  	<div class = "faq_btn">
      <div>
        <a href="ModifyForm?id=${dto.id }&page=${nowPage}">수정</a>
      </div>
      <div>
          <a href="DeleteForm?id=${dto.id }&oage=${nowPage}">삭제</a>
      </div>
    </div>
    
    <div class = "faq_data">
      <div class = "faq_question">
        ${dto.question }
      </div>
      <div class = "faq_answer">
        ${dto.answer }
      </div>
    </div>
    
	</c:forEach>
  </div>
  
  <div id = "faq_page">
      <c:if test="${pageStart > 1 }">
				<a href="<c:url value="List?page=${pageStart-1 }"/>">[이전]</a>
			</c:if>
			<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage == i }">
							[${i }]
					</c:when>		
					
					<c:otherwise>
					<a href="<c:url value="List?page=${i }"/>">${i }</a>
					</c:otherwise>		
				</c:choose>
				
				
				
			</c:forEach>
			
			<c:if test="${pageEnd<pageTotal }">
			<a href="<c:url value="List?page=${pageEnd+1 }"/>">[다음]</a>
			</c:if>
    </div>
    
    <div id = "newFAQ">
    	<a href="<c:url value="InsertForm?page=${nowPage }"/>">글쓰기</a>
    </div>
