<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!-- <h3>마이페이지 사이드 메뉴</h3> -->
<!-- <ul> -->

<!-- 	<li><a href="../info/">정보수정</a></li> -->
<%-- 	<c:choose> --%>
<%-- 		<c:when test = "${User.grade == 3 }"> --%>
<!-- 			<li><a href="../corpres/List">대관 정보</a></li> -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<li><a href="../res/List">대관 내역</a></li> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	
<!-- 	<li><a href="../board/List">내가 쓴 글</a></li> -->
<!-- </ul> -->

<div class="col-sm-2" style="margin-top:80px">
    <ul class="list-group mb-3">
		<c:choose>
			<c:when test = "${User.grade == 3 }">
				<li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
                <h6 class="my-0" ><a class="fs-6 text-secondary" href="../info/CorpMemberEdit">회원정보 수정</a></h6>
            </div>
		        </li>
		        <li class="list-group-item d-flex justify-content-between lh-sm">
		            <div>
		                <h6 class="my-0"><a class="fs-6 text-secondary" href="../corpres/List">대관 정보</a></h6>
		            </div>
		        </li>
		        
			</c:when>
			<c:otherwise>
			
				<li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
                <h6 class="my-0" ><a class="fs-6 text-secondary"  href="../info/MemberEdit">회원정보 수정</a></h6>
            </div>
		        </li>
		        <li class="list-group-item d-flex justify-content-between lh-sm">
		            <div>
		                <h6 class="my-0"><a class="fs-6 text-secondary" href="../res/List">대관 내역</a></h6>
		            </div>
		        </li>
			</c:otherwise>
		</c:choose>    
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
                <h6 class="my-0"><a class="fs-6 text-secondary" href="../board/List?board=bas_board">내가 쓴 글</a></h6>
            </div>
        </li>
    </ul>
</div>

