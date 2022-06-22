<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
h2#main_title {
	margin: 20px;
}

div#main_wrap {
	width: 1243px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

div#delete_table {
	margin: 30px;
}
</style>


 <div id="main_wrap">
<form action="DeleteReg" method="post" >
<input type="hidden" name = "post_id" value=${param.post_id } />
<input type="hidden" name = "page" value=${nowPage } />

 <div><h2 id="main_title">게시글 삭제</h2></div>
      <hr>
      <div id="delete_table">

        <div class="row text-center">
          <label for="title" class="col col-form-label">"삭제"를 입력하면 삭제됩니다.</label>
        </div>
        <div class="row " style="margin-top: 10px;">
          <div class="col text-center ">
            <input type="text" class="form-control" name="deleteCheck" style="width: 200px; display:inline-block" required >
          </div>
        </div>

        <div class="row" style="margin-top: 10px;">
          <div class="col text-center ">
              <a href="<c:url value="/commu_bas/board/Detail?post_id=${param.post_id }&page=${nowPage}"/>"><button type="button" class="btn btn-outline-secondary"> 뒤로</button></a>
             	<button type="submit" class="btn btn-outline-secondary">삭제</button>
          </div>
        </div>

      </div>
</form>
  </div> 