<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  <div class="container">
      <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-decoration-none" href="<c:url value="/"/>">
          <img src="<c:url value="/images/logo.png"/>" alt="프로젝트이름">
        </a>
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">대관</a>
            <ul class="dropdown-menu">
             	  <li><a class="dropdown-item" href="<c:url value="/gym/basketball/List"/>">농구 경기장</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/gym/soccer/List"/>">축구 경기장</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">레슨</a>
            <ul class="dropdown-menu">
             <li><a class="dropdown-item" href="<c:url value="/lesson/bas/List"/>">농구 레슨</a></li>
             <li><a class="dropdown-item" href="<c:url value="/lesson/soc/List"/>">축구 레슨</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">농구 게시판</a>
            <ul class="dropdown-menu">
              	  <li><a class="dropdown-item" href="<c:url value="/commu_bas/board/List"/>">자유 게시판</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/commu_bas/compet/List"/>">대회 정보</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/commu_bas/guest/List"/>">용병 게시판</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">축구 게시판</a>
            <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="<c:url value="/commu_soc/board/List"/>">자유 게시판</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/commu_soc/compet/List"/>">대회 정보</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/commu_soc/guest/List"/>">용병 게시판</a></li>
            </ul>
          </li>
           <li class="nav-item">
                <a class="nav-link link-dark"" href="<c:url value="/market/PostList"/>">장터</a>
              </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">고객 지원</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<c:url value="/support/notice/List"/>">공지사항</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/support/faq/List"/>">FAQ</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/support/feedback/home"/>">Q&A</a></li>
            </ul>
          </li>
        </ul>
  
        <div class="col-md-3 text-end">
         <c:choose>
				<c:when test="${User==null }">
					<a href="<c:url value="/member/Login"/>"><button type="button" class="btn btn-outline-primary me-2" >LOGIN</button></a>
					<a href="<c:url value="/member/Login"/>"><button type="button" class="btn btn-primary" >Sign-up</button></a>
					
				</c:when>
				<c:otherwise>
					<a href="<c:url value="/member/Logout"/>"><button type="button" class="btn btn-outline-primary me-2" >LOGOUT</button></a>
					<a href="<c:url value="/mypage/info/InputPass"/>"><button type="button" class="btn btn-primary" >MYPAGE</button></a>
					 <c:if test ="${User.grade == 1 }">
					 	<a href="<c:url value="/manager/adjustment/List"/>"><button type="button" class="btn btn-primary" >관리자</button></a>
					 </c:if>
         			 
				</c:otherwise>
			</c:choose>
        </div>
      </header>
    </div>
