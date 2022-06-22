<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
    <style>
        h2#main_title {
            margin: 20px;
        }
        div#main_wrap{
            width: 1243px;
            height: auto;
            margin-left:auto; 
            margin-right:auto;
        }
        div#delete_table {
        	margin: 30px;
        }
        
    </style>

<div id="main_wrap">
<h2 id="main_title">글 수정 폼</h2></div>

<form action="DeleteReg" method="post">
	<input type="hidden" name="post_id" value="${param.post_id }" />
	<input type="hidden" name="page" value="${nowPage }"/>
	
	<div id="delete_table">
	<table border="" width=600 align="center">
		
		<tr>
			<th>삭제하시려면 "삭제"를 써주세요!</th>
			<td><input type="text" name="deleteCheck" /></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			<a href="<c:url value="/lesson/soc/Detail?post_id=${param.post_id }&page=${nowPage }"/>"><button>뒤로</button></a>
			<input type="reset" value="취소" />
			<input type="submit" value="삭제" />
			
			</td>
		</tr>
	</table>
	</div>
</form>