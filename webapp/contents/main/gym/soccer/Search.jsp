<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}
</style>

<h1>축구 구장 검색 페이지</h1>
<div class = "row" style="margin-bottom:20px">
	 <div class="col-sm-5">
            <form action="Search">
             <input type="hidden" name ="dateSet" value="${dateSet }"/>
                <select class="form-select" name="filter" id="" style="width:auto; display: inline-block">
                    <option value="전체" <c:if test = "${param.filter == \"전체\" }">selected</c:if> >전체</option>
			        <option value="서울" <c:if test = "${param.filter == \"서울\" }">selected</c:if>>서울</option>
			        <option value="경기" <c:if test = "${param.filter == \"경기\" }">selected</c:if>>경기</option>
			        <option value="인천" <c:if test = "${param.filter == \"인천\" }">selected</c:if>>인천</option>
                </select>
                <input class="form-control" type="text" value="${param.keyword }" name = "keyword" placeholder="검색어를 입력하세요" style="width:250px; display: inline-block"/>
	            <button type="submit" class="btn btn-outline-secondary">검색</button>
            </form>  
            </div>
	<div class="col">
		<input type="text" name="selectDate" id="selectDate" class="ts fs-4 text-center"
			autocomplete="off" value="${dateSet }" />
		<script>
			var setDate = null;
			$(function() {
				$('#selectDate')
						.datepicker(
								{
									lang : 'ko',
									dateFormat : 'yy-mm-dd',
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ], //달력의 월 부분 텍스트
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ], //달력의 월 부분 Tooltip
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ], //달력의 요일 텍스트
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ], //달력의 요일 Tooltip
									minDate : 0,
									maxDate : '+1M',
									onSelect : function(dateText, inst) {

										var arr = dateText.split("/")
										var date = arr[0]
										location.href = "List?page=${nowPage}&dateSet="
												+ date;
									}
								});
			})
		</script>
	</div>
	<div class ="col-sm-2 text-end"  style="padding: 0px;">
		<a href="<c:url value="List"/>"><button type="button" class="btn btn-outline-secondary">목록으로</button></a>
		<c:if test ="${User.grade==1 }">
		<a href="<c:url value="InsertForm?page=${nowPage }"/>"><button type="button" class="btn btn-outline-secondary">글쓰기</button></a>
		</c:if>
	</div>
</div>
<!-- <div id = "table_wrap"> -->

<!-- <table border="">  -->

<!-- 	<tr> -->
<!-- 		<th>이미지</th> -->
<!-- 		<th>경기장</th> -->
<!-- 		<th>매니저</th> -->
<!-- 		<th>작성일</th> -->
<!-- 	</tr> -->
<%-- 	<c:forEach var="dto" items="${mainData }" varStatus="no"> --%>

<!-- 	<tr> -->
<!-- 		<td> -->
<%-- 			<img src="<c:url value="/uploadFile/gym/basketball/${fn:split(dto.img, ',')[0]}"/>" alt="" /> --%>
<!-- 		</td> -->
<!-- 		<td> -->
<%-- 			<a href="<c:url value="Detail?id=${dto.id }&page=${nowPage }&dateSet=${dateSet }"/>">${dto.sname }</a> --%>
<!-- 		</td> -->
<%-- 		<td>${dto.manager_id }</td> --%>
<!-- 		<td> -->
<%-- 		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/> --%>
<!-- 		</td> -->
<!-- 	</tr> -->

<%-- 	</c:forEach> --%>
<!-- 	<tr> -->
<!-- 		<td colspan="5" align="center"> -->
<%-- 			<c:if test="${pageStart > 1 }"> --%>
<%-- 				<a href="<c:url value="List?page=${pageStart-1 }"/>">[이전]</a> --%>
<%-- 			</c:if> --%>
<%-- 			<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${nowPage == i }"> --%>
<%-- 							[${i }] --%>
<%-- 					</c:when>		 --%>

<%-- 					<c:otherwise> --%>
<%-- 					<a href="<c:url value="List?page=${i }"/>">${i }</a> --%>
<%-- 					</c:otherwise>		 --%>
<%-- 				</c:choose> --%>

<%-- 			</c:forEach> --%>

<%-- 			<c:if test="${pageEnd<pageTotal }"> --%>
<%-- 			<a href="<c:url value="List?page=${pageEnd+1 }"/>">[다음]</a> --%>
<%-- 			</c:if> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="5" align="right"> -->
<%-- 			<a href="<c:url value="InsertForm?page=${nowPage }"/>">글쓰기</a> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->
<!-- </div> -->

<div id=gym_lit_wrap>
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		<div class="row gym_list">
			<div class="col-sm-5 gym_item_img">
				<a
					href="<c:url value="Detail?id=${dto.id }&page=${nowPage }&dateSet=${dateSet }"/>"><img
					src="<c:url value="/uploadFile/gym/soccer/${fn:split(dto.img, ',')[0]}"/>"
					class="img-fluid rounded;" alt="${dto.sname }" /></a>

			</div>
			<div class="col-sm-7 right-note gym_item_info">
				<div class="row">
					<div class="col-sm-4 gym_info_date pe-none">${dateSet }</div>
					<div class="col gym_info_address pe-none">${dto.address }</div>
				</div>
				<div class="row">
                  <div class="col">
                  <p class="text-center fs-3 fw-bold">
                  <a class ="link-secondary" href="<c:url value="Detail?id=${dto.id }&page=${nowPage }&dateSet=${dateSet }"/>">${dto.sname }</a>
                  </p>
                  </div>
           		 </div>
            
				<div class="row">
					<div class="col gym_info_bottom">
						<div class="row gym_info_bottom_row">
							<div class="bottom_text pe-none" id="${no.index }">예약 현황</div>
							<div class="row res_time_div">
								<div class="col res_time_text pe-none">오전</div>
								<div class="col res_time_ea pe-none">00~02시</div>
								<div class="col res_time_ea pe-none">02~04시</div>
								<div class="col res_time_ea pe-none">04~06시</div>
								<div class="col res_time_ea pe-none">06~08시</div>
								<div class="col res_time_ea pe-none">08~10시</div>
								<div class="col res_time_ea pe-none">10~12시</div>
							</div>
							<div class="row res_time_div">
								<div class="col res_time_text pe-none">오후</div>
								<div class="col res_time_ea pe-none">00~02시</div>
								<div class="col res_time_ea pe-none">02~04시</div>
								<div class="col res_time_ea pe-none">04~06시</div>
								<div class="col res_time_ea pe-none">08~08시</div>
								<div class="col res_time_ea pe-none">08~10시</div>
								<div class="col res_time_ea pe-none">10~12시</div>
							</div>
						</div>
						
						<div class="row gym_info_bottom_row">
							<div class="bottom_text pe-none">옵션</div>
							<div class="row ">
								<div class="row option_div">
									<div class="col pe-none" 
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option1}">background:yellow;</c:if>">샤워장
									</div>
									<div class="col pe-none"
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option2}">background:yellow;</c:if>">주차장</div>
									<div class="col pe-none"
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option3}">background:yellow;</c:if>">냉/난방시설</div>
									<div class="col pe-none"
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option4}">background:yellow;</c:if>">정수기</div>
									<div class="col pe-none"
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option5}">background:yellow;</c:if>">마룻바닥</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageStart > 1 }">
				<li class="page-item disabled">
					<a class="page-link" href="<c:url value="Search?page=${pageStart-1 }&dateSet=${dateSet }&filter=${parma.filter }&keyword=${param.keyword }"/>">이전</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage == i }">
						<li class="page-item disabled"><a class="page-link"
							href="<c:url value="Search?page=${i }&dateSet=${dateSet }&filter=${parma.filter }&keyword=${param.keyword }"/>">${i }</a>
						</li>
					</c:when>

					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="<c:url value="Search?page=${i }&dateSet=${dateSet }&filter=${parma.filter }&keyword=${param.keyword }"/>">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<c:if test="${pageEnd<pageTotal }">
				<li class="page-item">
					<a class="page-link" href="<c:url value="Search?page=${pageEnd+1 }&dateSet=${dateSet }&filter=${parma.filter }&keyword=${param.keyword }"/>">다음</a>
				</li>
			</c:if>
		</ul>
	</nav>
	
	
</div>

<script>
	var priceList = $("div.res_time_ea")

	var resdate = ${resdateList}

	var unused_time = ${unused}

	for (var i = 0; i < priceList.length; i++) {
		var index = parseInt(i / 12)

		if (unused_time[index] != '' && unused_time[index] != 'null'
				&& unused_time != null) {

			var unusedArr = unused_time[index].split(',')

			for (var j = 0; j < unusedArr.length; j++) {
				if (i % 12 == unusedArr[j]) {
					priceList[i].style.background = 'gray'
					break;
				}
			}
		}

		if (resdate[index] != '' && resdate[index] != 'null' && resdate != null) {
			var resdateArr = resdate[index].split(',')

			for (var j = 0; j < resdateArr.length; j++) {
				if (i % 12 == resdateArr[j]) {
					priceList[i].style.background = 'blue'
					break;
				}
			}
		}
	}
</script>
