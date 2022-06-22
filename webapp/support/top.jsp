<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- <a href="<c:url value="/info/Hello"/>"> 대관</a> --%>
<%-- <a href="<c:url value="/product/List"/>"> 수강</a> --%>
<%-- <a href="<c:url value="/gallery/List"/>"> 커뮤니티</a> --%>
<%-- <a href="<c:url value="/support/notice/List"/>"> 고객지원</a> --%>
<%-- <a href="<c:url value="/support/faq/List"/>"> 자주묻는질문</a> --%>
<!-- <hr /> -->
<script>
	
	document.addEventListener('DOMContentLoaded', ()=>{
	
		const mainMenu = document.querySelectorAll('#mainmenu_list>li>a')
		const headerWrap = document.querySelector('#header_wrap')
		const subMenu = document.querySelectorAll('.submenu_list')
		
		for(const item of mainMenu){
			item.addEventListener('mouseenter',mainMenuOver)
		}
		
		headerWrap.addEventListener('mouseleave',mainMenuLeave)
		
		
		function mainMenuOver(){
			menuActivate()
		}
		
		function mainMenuLeave(){
			menuInActivate()
		}
		
		function menuActivate(){
			gsap.to(headerWrap, {height:215, duration : 0.3, ease:'power1.out'})
			for(const item of subMenu){
				gsap.set(item, {display:'block'})
			}
		}
		
		function menuInActivate(){
			gsap.to(headerWrap, {height:114, duration : 0.3, ease:'power1.out'})
			for(const item of subMenu){
				gsap.set(item, {display:'none'})
			}
		}
	})
	

</script>

  <div id="header_wrap">
    <header>
        <h1 id="logo"><a href="<c:url value="/"/>" title="클램쉘메인페이지바로가기"><img src="<c:url value="/images/logo.png"/>" alt="프로젝트이름"></a></h1>
        <nav id="topmenu">
          <h2 class="hidden">상단빠른메뉴</h2>
          <ul id="topmenu_list">
            <li><a href="#">LOGIN</a></li>
            <li><a href="#">JOIN</a></li>
            <li><a href="#">MYPAGE</a></li>
          </ul>
        </nav>
        
        <nav id="mainmenu">
            <h2 class="hidden">메인메뉴</h2>
            <ul id="mainmenu_list">
              <li>
                <a href="<c:url value="/info/Hello"/>">경기장대관</a>
                <ul class="submenu_list">
                  <li><a href="#">농구장</a></li>
                  <li><a href="#">축구장</a></li>
                </ul>
              </li>

              <li>
                <a href="#">레슨</a>
                <ul class="submenu_list">
                  <li><a href="#">농구</a></li>
                  <li><a href="#">축구</a></li>
                </ul>
              </li>
              <li>
                <a href="#">농구게시판</a>
                <ul class="submenu_list">
                  <li><a href="#">대회정보</a></li>
                  <li><a href="#">자유게시판</a></li>
                  <li><a href="#">용병</a></li>
                </ul>
              </li>
              <li>
                <a href="#">축구게시판</a>
                <ul class="submenu_list">
                  <li><a href="#">대회정보</a></li>
                  <li><a href="#">자유게시판</a></li>
                  <li><a href="#">용병</a></li>
                </ul>
              </li>
              <li>
                <a href="<c:url value="/support/notice/List"/>">고객지원</a>
                <ul class="submenu_list">
                  <li><a href="<c:url value="/support/notice/List"/>">공지사항</a></li>
                  <li><a href="<c:url value="/support/faq/List"/>">자주묻는 질문</a></li>
                  <li><a href="<c:url value="/support/feedback/home"/>">고객 말씀</a></li>
                  <li><a href="<c:url value="/support/info/List"/>">홈페이지 정보</a></li>
                </ul>
              </li>
            </ul>
        </nav>
    </header>
  </div>