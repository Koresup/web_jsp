<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ready to Play</title>

<style>
 #img_bas {
            opacity: 0.5;
}
#img_soc {
    opacity: 0.5;
}
#img_commu {
    opacity: 0.5;
}
#img_market {
    opacity: 0.5;
}
#img_bas:hover {
    opacity: 1.0;
}
#img_soc:hover {
    opacity: 1.0;
}
#img_commu:hover {
    opacity: 1.0;
}
#img_market:hover {
    opacity: 1.0;
}

main{
/* width : 1200px; */
/* height : 100%; */
margin: 0;
padding: 0;

}


footer {
    width: 100%;
    height: 120px;
    bottom: 0px;
    border-top: 1px solid #c4c4c4;
    padding-top: 10px;
    color: #808080;
    font-size: 11px;
    
}
.foo_div {
    padding-left: 10px;
    float: left;
}
      
table#footer_table {
    float: left;
}


.footer_div1 {
    float: right;
}
footer p {
    margin-top: 0;
    margin-bottom: 0;
}

.footer_div1 span {
    font-size: 12px;
    margin-bottom: 4px;
}


img#footer_logo {
    width: 100px;
    height: auto;
}
</style>
</head>
<link rel="stylesheet" href="/readytoplay/css/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
    
    <main>
    		<div class = "row" style="height : 450px; margin-bottom:20px" >
			    <div style="float:left;width:50%;height:100%;text-align: right;" >
			        <a href="<c:url value="/gym/basketball/List"/>"><img id="img_bas" src="/readytoplay/images/main_bas.png" class="border border-danger border-3" width="70%" height="100%" alt="상,좌"></a>
			    </div>
			    <div style="clear:right;float:right;width:50%;height:100%;text-align: left;">
			        <a href="<c:url value="/gym/soccer/List"/>"><img id="img_soc" src="/readytoplay/images/main_soc.png" class=" border border-success border-3" width="70%" height="100%" alt="상,우"></a>
			    </div>
	    </div>
	    
		<div class = "row" style="height : 450px">	    
		    <div style="float:left;width:50%;height:100%;text-align: right;">
		        <a href="<c:url value="/commu_bas/board/List"/>"><img id="img_commu" src="/readytoplay/images/main_commu_bas.png" class=" border border-warning border-3" width="70%" height="100%" alt="하,좌"></a>
		    </div>
	    
	    
		    <div style="clear:right;float:right;width:50%;height:100%;text-align: left;">
		        <a href="<c:url value="/market/PostList"/>"><img id="img_market" src="/readytoplay/images/main_market.png" class="border border-primary border-3" width="70%" height="100%" alt="하,우"></a>
		    </div>
	    </div>
    </main>
	<footer>
    <div class="foo_div">
        <table id = footer_table>
            <tr>
                <td>
                    <div class=" translate-middle-y" style ="margin-right:20px">
                        <img src="/readytoplay/images/ready2play.png" id="footer_logo">
                    </div>
                </td>
                <td>
                    <div class="footer_div1">
                        <span>(주)삼김전일</span><span> | </span>
                        <span>대표 : 전경진</span><span> | </span>
                        <span>사업자등록번호 : 481-36-00926</span><br>
                        <span>주소 : 서울시 강남구 역삼동 815-4 만이빌딩 503호</span><br>
                        <span>이메일 : hoyoun1309@gmail.com | ood1208@gmail.com | </span><br />
                        <span>alstn6887@gmail.com | adonises84@gmail.com</span><br />
                        <span>Copyright 2022. green. All Rights Reserved.</span>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</footer>
</body>
</html>