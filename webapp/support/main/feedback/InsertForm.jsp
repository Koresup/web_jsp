<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <h1>공지사항</h1>

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

    div#input_title input{
      height: 30px;
      font-size: 30px;
      margin-top: 5px;
    }

    div#input_filter select{
      height: 30px;
      font-size: 20px;
      margin-top: 10px;
    }

    div#input_content textarea{
      font-size: 20px;
      margin-top: 10px;
    }
    
  </style>

 <div id = div_input>
  <form action="InsertReg" method="post">
    <div id = "input_title">
      제목 : 
      <input type="text" size = "30" name = "title">
    </div>

    <div id = "input_filter">
      필터 : 
      <select name="filter" id="">
        <option value="문의">문의</option>
        <option value="대관">대관</option>
        <option value="수강">수강</option>
        <option value="신고">신고</option>
        <option value="불편">불편</option>
      </select> 
    </div>

    <div id = "input_content">
      <p>본문</p>
      <textarea name="content" id="" cols="60" rows="10"></textarea>
    </div>

    <div id ="input_submit">
      <input  type="submit">
    </div>
    
    <input type="hidden" name ="user_id" value="user1" />
  </form>

<a href="home">돌아가기</a>
</div>