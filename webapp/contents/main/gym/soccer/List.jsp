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

<div class="row border-dark border-bottom" style="margin-bottom:30px">
      <h1>축구장 대관</h1>
</div>
<div class = "row" style="margin-bottom:20px">
	 <div class="col-sm-5">
            <form action="Search">
            <input type="hidden" name ="dateSet" value="${dateSet }"/>
                <select class="form-select" name="filter" id="" style="width:auto; display: inline-block">
                    <option value="전체">전체</option>
			        <option value="서울">서울</option>
			        <option value="경기">경기</option>
			        <option value="인천">인천</option>
                </select>
                <input class="form-control" type="text" name = "keyword" placeholder="구장을 검색하세요" style="width:250px; display: inline-block"/>
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
	<c:if test="${User.grade==1 }">
	<div class ="col-sm-1" style="padding: 0px; width:75px">
		<a href="<c:url value="InsertForm?page=${nowPage }"/>"><button type="button" class="btn btn-outline-secondary">글쓰기</button></a>
	</div>
	</c:if>
</div>

<div id=gym_lit_wrap>
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		<c:choose >
			<c:when test="${dto.img == null || dto.img == \"\"}">
				<c:set var = "res" value="/readytoplay/images/nullImg.png"/>
			</c:when>
			<c:otherwise>
				<c:set var = "res" value="/readytoplay/uploadFile/gym/soccer/${fn:split(dto.img, ',')[0]}"/>
			</c:otherwise>
		</c:choose>
		<div class="row gym_list">
			<div class="col-sm-5 gym_item_img">
				<a
					href="<c:url value="Detail?id=${dto.id }&page=${nowPage }&dateSet=${dateSet }"/>"><img
					src="${res }"
					class="img-fluid rounded;" alt="${dto.sname }" style="width:500px; height:300px"/></a>

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
						<div class="row gym_info_bottom_row" style="background:wheat; padding:10px">
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
						
						<div class="row gym_info_bottom_row" style="margin-top:15px">
							<div class="bottom_text pe-none">옵션</div>
							<div class="row ">
								<div class="row option_div">
									<div class="col pe-none" 
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option1}">background:wheat;</c:if>">샤워장
									</div>
									<div class="col pe-none"
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option2}">background:wheat;</c:if>">주차장</div>
									<div class="col pe-none"
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option3}">background:wheat;</c:if>">냉/난방시설</div>
									<div class="col pe-none"
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option4}">background:wheat;</c:if>">정수기</div>
									<div class="col pe-none"
										style="background: white; margin: 5px; text-align: center;
										<c:if test="${dto.option5}">background:wheat;</c:if>">마룻바닥</div>
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
					<a class="page-link" href="<c:url value="List?page=${pageStart-1 }&dateSet=${dateSet }"/>">이전</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage == i }">
						<li class="page-item disabled"><a class="page-link"
							href="<c:url value="List?page=${i }&dateSet=${dateSet }"/>">${i }</a>
						</li>
					</c:when>

					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="<c:url value="List?page=${i }&dateSet=${dateSet }"/>">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<c:if test="${pageEnd<pageTotal }">
				<li class="page-item">
					<a class="page-link" href="<c:url value="List?page=${pageEnd+1 }&dateSet=${dateSet }"/>">다음</a>
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
					priceList[i].style.background = 'lightgray'
					break;
				}
			}
		}

		if (resdate[index] != '' && resdate[index] != 'null' && resdate != null) {
			var resdateArr = resdate[index].split(',')

			for (var j = 0; j < resdateArr.length; j++) {
				if (i % 12 == resdateArr[j]) {
					priceList[i].style.background = 'lightgray'
					break;
				}
			}
		}
	}
</script>
