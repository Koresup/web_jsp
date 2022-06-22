<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main_wrap">
     <div class="row border-dark border-bottom" style="margin-bottom:20px">
		<h1>Q&A 작성</h1>
	</div>
	
	<div class="row">
	  	<div class ="col text-end" style="margin-bottom:10px; margin-right:10px">
			<a href="MyQuestion?page=${nowPage }"><button type="button" class="btn btn-outline-secondary"> 뒤로</button></a>
	  	</div>
	</div>
	
	<form action="InsertReg" method="post">
		 <input type="hidden" name="user_id" value="${User.pid }" />
        <div id="">
          <div class="mb-3 row">
            <label for="title" class="col-sm-2 col-form-label" >제목</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="title" name = "title" required>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="title" class="col-sm-2 col-form-label">구분</label>
            <div class="col-sm-10">
              <select class ="form-select form-select-lg mb-3" name="filter" id="">
		        <option value="문의">문의</option>
			    <option value="대관">대관</option>
			    <option value="수강">수강</option>
			    <option value="신고">신고</option>
			    <option value="불편">불편</option>
		      </select> 
            </div>
          </div>
          <div class="mb-3 row">
            <label for="content" class="col-sm-2 col-form-label" >내용</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="content" name = "content" rows="15" required></textarea>
            </div>
          </div>
          
          <div class="mb-3 row">
            <label for="BTN" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10 text-end" id="BTNsubmit">
             	<button type="reset" class="btn btn-outline-secondary">초기화</button>
             	<button type="submit" class="btn btn-outline-secondary">등록</button>
            </div>
          </div>
        </div>
	</form>
</div>   

<!--  <div id = div_input> -->
<!--   <form action="InsertReg" method="post"> -->
<!--     <div id = "input_title"> -->
<!--       제목 :  -->
<!--       <input type="text" size = "30" name = "title"> -->
<!--     </div> -->

<!--     <div id = "input_filter"> -->
<!--       필터 :  -->
<!--       <select name="filter" id=""> -->
<!--         <option value="문의">문의</option> -->
<!--         <option value="대관">대관</option> -->
<!--         <option value="수강">수강</option> -->
<!--         <option value="신고">신고</option> -->
<!--         <option value="불편">불편</option> -->
<!--       </select>  -->
<!--     </div> -->

<!--     <div id = "input_content"> -->
<!--       <p>본문</p> -->
<!--       <textarea name="content" id="" cols="60" rows="10"></textarea> -->
<!--     </div> -->

<!--     <div id ="input_submit"> -->
<!--       <input  type="submit"> -->
<!--     </div> -->
    
<!--     <input type="hidden" name ="user_id" value="user1" /> -->
<!--   </form> -->

<!-- <a href="home">돌아가기</a> -->
<!-- </div> -->