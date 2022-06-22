<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="main_wrap">

	<form action="InsertReg" method="post">
        <div class="row border-dark border-bottom" style="margin-bottom:20px">
			<h1>FAQ 작성</h1>
		</div>
		
		<div class="row">
	  	<div class ="col text-end" style="margin-bottom:10px; margin-right:10px">
			<a href="List?page=${nowPage }"><button type="button" class="btn btn-outline-secondary"> 목록으로</button></a>
	  	</div>
	  	
	  	</div>
        <div class="mb-3 row">
          <label for="content" class="col-sm-2 col-form-label fs-2 fw-bold" >Question</label>
          <div class="col-sm-10">
              <textarea class="form-control" id="question" name = "question" rows="10"  placeholder="질문을 입력하세요" required></textarea>
          </div>
        </div>
        <div class="mb-3 row">
          <label for="content" class="col-sm-2 col-form-label fs-2 fw-bold" >Answer</label>
          <div class="col-sm-10">
              <textarea class="form-control" id="answer" name = "answer" rows="10" placeholder="답변을 입력하세요" required></textarea>
          </div>
        </div>
        <div class="mb-3 row">
          <label for="BTN" class="col-sm-2 col-form-label"></label>
          <div class="col-sm-10 text-end" id="BTNsubmit">
           	<button type="reset" class="btn btn-outline-secondary">초기화</button>
           	<button type="submit" class="btn btn-outline-secondary">등록</button>
          </div>
        </div>
	</form>
</div>   

<!--  <div id = div_input> -->
<!--   <form action="InsertReg" method="post"> -->
<!--     <div id = "input_title"> -->
<!--       Q  -->
<!--       <textarea name="question" id="" cols="60" rows="10"></textarea> -->
<!--     </div> -->

<!--     <div id = "input_content"> -->
<!--       A -->
<!--       <textarea name="answer" id="" cols="60" rows="10"></textarea> -->
<!--     </div> -->

<!--     <div id ="input_submit"> -->
<!--       <input  type="submit"> -->
<!--     </div> -->
<!--   </form> -->

<!-- </div> -->