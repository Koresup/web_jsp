<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberDTO"%>
<%@page import="member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link href="/readytoplay/css/login.css" rel="stylesheet">

   
    <main class="text-center form-signin">
        <form action="LoginReg" method="post">
            <img id="logo_img" class="mb-4" src="<c:url value="/images/logo.png"/>" alt="" width="72" height="57">
            <h1 id="login_text" class="h3 mb-3 fw-normal">Are you Ready?</h1>

            <div id="type_select">
                <input type="radio" class="btn-check" name="memberkind" id="option1" value="개인회원" autocomplete="off" checked>
                <label class="btn btn-secondary" for="option1" >개인 회원</label>
                <input type="radio" class="btn-check" name="memberkind" id="option2" value="법인회원" autocomplete="off">
                <label class="btn btn-secondary" for="option2" >법인 회원</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="pid" name="pid" >
                <label for="pid">ID</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
                <label for="pw">Password</label>
            </div>

            <div class="checkbox mb-3">
            </div>
            <div id="login_btn">
                <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
            </div>
            <div id="signup_btn">
                <button class="w-100 btn btn-lg btn-primary" type="button" onclick="location.href='/readytoplay/member/TypeSelect'">회원 가입</button>
            </div>
             <div style="margin-top: 30px;"><a href="/readytoplay/member/FindId">아이디 찾기</a><a href="/readytoplay/member/FindPw_CheckId" style="margin-left: 40px;">비밀번호 찾기</a></div>
            <p class="mt-5 mb-3 text-muted">&copy; 2022</p>
        </form>
    </main>


    