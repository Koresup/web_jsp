<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="/readytoplay/css/market.css">

<div id="main_area">
	<div id="postlist_header">
		<header>
			<p id="postlist_title">장터</p>
			<p id="postlist_subtitle">농구 & 축구 용품을 자유롭게 사고 팔 수 있습니다.</p>
		</header>
		<div id="postlist_search">
			<form id="category_select" action="PostSearchList" method="post" class="input-group mb-3">
				<select id="l_field" name="l_field" class="form-select"
					aria-label="Default select example">
					<option value="list">전체</option>
					<option value="농구용품">농구용품</option>
					<option value="축구용품">축구용품</option>
				</select> 
				<select id="s_field" name="s_field" class="form-select" aria-label="Default select example">
					<option value="list">전체</option>
					<option value="신발">신발</option>
					<option value="의류">의류</option>
					<option value="기타용품">기타용품</option>
				</select> 
				<input type="text" id="search" name="search" class="form-control" /> 
				<input type="submit" value="검색" class="btn btn-outline-secondary" />
			</form>
			<div><button type="button" class="btn btn-outline-secondary" onclick="location.href='PostInsert?page=${nowPage }'">글쓰기</button></div>
		</div>
	</div>

	<div id="postlist">
		<div class="container">
			<div class="row" style=" margin-top: 40px">
				<c:forEach var="dto" items="${mainData }" varStatus="no">
					<c:if test="${(no.index+1)%4 == 0 }">
						</div>
						<div class="row"> 
					</c:if>
					<div class="col"
						OnClick="location.href ='PostDetail_Reg?post_id=${dto.post_id }&page=${nowPage }'"
						style="cursor: pointer;">
						<c:choose >
							<c:when test="${dto.firstImg == null }">
								<c:set var = "res" value="/readytoplay/images/nullImg.png"/>
							</c:when>
							<c:otherwise>
								<c:set var = "res" value="/readytoplay/uploadFile/market/${dto.firstImg }"/>
							</c:otherwise>
						</c:choose>
						<img src="${res }" class="img-thumbnail" alt="상품 이미지">
						<div class="product_detail">
							<p>상품명 : ${dto.title }</p>
							<p>상품 상태 : ${dto.check_quality }</p>
							<p>거래방법 : ${dto.delivery }</p>
						</div>
						<div class="product_price">금액 : ${dto.price }</div>
					</div>
					<c:if test="${(no.index+1)%8 == 0 }">
					</div>
					</c:if>
				</c:forEach>
			</div>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center"
				style="margin-top: 50px;">
				<c:if test="${pageStart > 1 }">
					<li class="page-item">
					<a class="page-link" href="<c:url value="/market/PostList?page=${pageStart-1 }"/>">이전</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
					<c:choose>
						<c:when test="${nowPage == i }">
						<li class="page-item">
							<p class="page-link">${i }</p>
						</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="<c:url value="/market/PostList?page=${i }"/>">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageEnd<pageTotal }">
					<li class="page-item"><a class="page-link"
						href="<c:url value="/market/PostList?page=${pageEnd+1 }"/>">다음</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>
</div>