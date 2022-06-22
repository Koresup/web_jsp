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

div#commu_soc_board_detail {
	border: 1px solid #d7dce2;
	padding: 20px;
	margin: 20px;
	border-radius: 25px;
}

td.title {
	text-align: center;
	font-size: 40px;
}

td.reg_date {
	text-align: right;
}

td.cnt {
	text-align: right;
}

td.img {
	text-align: center;
}

td.content {
	padding: 50px;
	text-align: center;
}

td.upfile {
	text-align: left;
}

td.modiNdel {
	text-align: right;
}
</style>

   
   <form action="ModifyReg" method="post" enctype="multipart/form-data">
	<input type="hidden" name="post_id" value="${dto.post_id }"/>
	<input type="hidden" name="nowPage" value="${nowPage }" />
   <div id="main_wrap">
       <div>
           <h2 id="main_title">축구 자유게시판 글 수정</h2>
       </div>
       <hr>
       <div id="commu_soc_board_detail">
           <table class="table">
               <tr>
                   <td class="title" colspan="4"><input type="text" name="title" value="${dto.title }"/></td>
               </tr>
               <tr>
                   <td colspan="2">작성자 : ${dto.user_id }</td>
                   <td>${dto.reg_date }</td>
		        <td>${dto.cnt }</td>
                   
               </tr>
               <tr>
                   <td class="img" colspan="4">
                   </td>
               </tr>
               <tr>
                   <td class="content" colspan="4"><textarea name="content" cols="100" rows="10" style="resize:none;">${dto.content }</textarea></td>
               </tr>
               <tr>
                   <td>첨부파일</td>
                   <td class="upfile" colspan="3"><input type="file" name="upfile" value="${dto.upfile }" multiple/></td>
               </tr>
               <tr>
                   <td>이미지파일</td>
                   <td class="upfile" colspan="3"><input type="file" name="img" value="${dto.img }" multiple/></td>
               </tr>
               <tr>
                   <td class="toList" colspan="2">
                       <a href="<c:url value="/commu_soc/board/List?page=${nowPage }"/>"><button>목록으로</button></a>
                   </td>
                   <td class="modiNdel" colspan="2">
                   	<a href="<c:url value="/commu_soc/board/Detail?post_id=${dto.post_id }&page=${nowPage }"/>"><button type="button">뒤로</button></a>
                   	<input type="reset" value="초기화" />
					<input type="submit" value="수정" />
					<input type="hidden" value="${nowPage }" name="nowPage"/>
                   </td>
               </tr>                
           </table>
       </div>
       </div>
       </form>