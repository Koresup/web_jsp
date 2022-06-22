<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

#commu_soc_compet_post {
	border: 1px solid #d7dce2;
	padding: 20px;
	margin: 20px;
	border-radius: 25px;
}

div#BTNsubmit {
	text-align: right;
}
</style>

    
<form action="InsertReg" method="post" enctype="multipart/form-data">
<input type="hidden" name ="user_id"  value="${User.pid }"/>
   <div id="main_wrap">
       <div><h2 id="main_title">축구 대회 새글쓰기</h2></div>
       <hr>
       <div id="commu_soc_compet_post">
         <div class="mb-3 row">
           <label for="head" class="col-sm-2 col-form-label">지역</label>
           <div class="col-sm-10">
			<input type="text" class="form-control" id="head" name="head" placeholder="지역" >
           </div>
         </div>
         <div class="mb-3 row">
           <label for="title" class="col-sm-2 col-form-label">제목</label>
           <div class="col-sm-10">
             <input type="text" class="form-control" id="title" name="title" placeholder="제목" >
           </div>
         </div>
         <div class="mb-3 row">
           <label for="content" class="col-sm-2 col-form-label">내용</label>
           <div class="col-sm-10">
               <textarea class="form-control" id="content" name="content" rows="15" style="resize:none" placeholder="내용을 입력하세요"></textarea>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="img" class="col-sm-2 col-form-label">이미지 첨부</label>
        <div class="col-sm-10">
          <input type="file" class="form-control" id="img" name="img" multiple>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="upfile" class="col-sm-2 col-form-label">파일 첨부 </label>
        <div class="col-sm-10">
          <input type="file" class="form-control" id="upfile" name="upfile" multiple>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="BTN" class="col-sm-2 col-form-label"></label>
        <div class="col-sm-10" id="BTNsubmit">
            <input type="reset" value="초기화">
            <input type="submit" value="등록">
        </div>
      </div>
    </div>
    <div id="post_bottom">

    </div>
</div>
</form>