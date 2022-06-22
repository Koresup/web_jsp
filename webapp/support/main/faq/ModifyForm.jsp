<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <h1>FAQ Insert</h1>

<style>
    div#div_input{
      width:980px;
      margin:0px auto;
      border: solid 1px black;
    }


    div#div_input form{
      width : 700px;
      margin : 0px auto;
    }

    div#input_title textarea{
      font-size: 20px;
      margin-top: 10px;
    }

    div#input_content textarea{
      font-size: 20px;
      margin-top: 10px;
    }
    
  </style>

 <div id = div_input>
  <form action="ModifyReg" method="post">
  	<input type="hidden" name = "id" value="${dto.id }" />
    <div id = "input_title">
      Q 
      <textarea name="question" id="" cols="60" rows="10">${dto.question }</textarea>
    </div>

    <div id = "input_content">
      A
      <textarea name="answer" id="" cols="60" rows="10">${dto.answer }</textarea>
    </div>

    <div id ="input_submit">
    	<a href="<c:url value="List?page=${nowPage}"/>">뒤로</a>
      <input  type="submit" value="수정">
    </div>
  </form>

</div>