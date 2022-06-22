<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main_wrap">
	<div class="row border-dark border-bottom" style="margin-bottom:20px">
		<h1>Q&A 삭제</h1>
	</div>
	
	<form action="DeleteReg" method="post" >
	<input type="hidden" name = "id" value=${param.id } />
	<input type="hidden" name = "page" value=${nowPage } />

      <div id="commu_bas_board_post">

        <div class="row text-center">
          <label for="title" class="col col-form-label fw-bold">"삭제"를 입력하면 작성하신 Q&A가 삭제됩니다.</label>
        </div>
        <div class="row " style="margin-top: 10px;">
          <div class="col text-center ">
            <input type="text" class="form-control" name="deleteCheck" style="width: 200px; display:inline-block" required >
          </div>
        </div>

        <div class="row" style="margin-top: 10px;">
          <div class="col text-center ">
              <a href="<c:url value="Detail?id=${param.id }&page=${nowPage}"/>"><button type="button" class="btn btn-outline-secondary"> 뒤로</button></a>
             	<button type="submit" class="btn btn-outline-secondary">삭제</button>
          </div>
        </div>

      </div>
</form>
     
  </div> 
