<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <style>
 
 ul#resTime_list li.selected{
    background:red;   
  }  
  
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}
  
 </style>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c59b252c5ce6b362867c5d3da3e6369c&libraries=services"></script>
<script>
	document.addEventListener('DOMContentLoaded', ()=>{
		
		var total = 0;
		const priceList = document.querySelectorAll('#resTime_list>li')
		var div = document.getElementById('pricediv')
		
		var timeInput = document.getElementById('timeSelect')
		
		var selectItemNum = 0
		
		var timeSelect = [];
		
		var selectedList = null;
		
		var date = '${param.dateSet}'
		var week = new Date(date).getDay();
		
		var weekly = 0
		var nighttime = 0
		
		if(week==0||week==6){
			weekly = ${dto.price_weekend_weekly}
			nighttime = ${dto.price_weekend_nighttime}
		}else{
			weekly = ${dto.price_weekday_weekly}
			nighttime = ${dto.price_weekday_nighttime}
		}
		
		var unused_time = '${dto.unused_time}'
		const unusedArr = unused_time.split(',')
		
		var str = '${resData}'
		const arr = str.split(',')
		console.log(str)
		console.log(arr)
	        		  
		var isEnabled = true;
		for(var i = 0; i<priceList.length; i++){
			if(unused_time != ''){
				for(var j = 0; j<unusedArr.length; j++){
					if(i == unusedArr[j]){
						console.log(unusedArr[j])
						priceList[i].classList.remove('list-group-item-primary')
						priceList[i].classList.add('list-group-item-secondary')
						isEnabled = false;
						break;
					}
				}
			}
			
			if(str != ''){
				for(var j = 0; j<arr.length; j++){
					if(i == arr[j]){
						console.log(arr[j])
						priceList[i].classList.remove('list-group-item-primary')
						priceList[i].classList.add('list-group-item-secondary')
						isEnabled = false;
						break;
					}
				}
			}
			
			if(isEnabled){
				priceList[i].addEventListener('click', selectTime)
			}
			
			isEnabled = true;
		}
		
		 function getIndex(checkList){
	            let selectedIndex = 0;
	            while((checkList=checkList.previousElementSibling) != null){
	              selectedIndex++
	            }

	            return selectedIndex
	          }
		
	 function selectTime(){
	          if(!this.classList.contains('list-group-item-danger')){
	        	  if(selectItemNum<2){
	        		  this.classList.remove('list-group-item-primary')
	        		  this.classList.add('list-group-item-danger')
		        	  if(this.value == 1){
		 	       	  	total += weekly
		        	  }else{
		        		total += nighttime
		        	  }
		        	  if(selectItemNum == 0){
		        	  	timeSelect[0] = getIndex(this)
		        	  }else{
		        		timeSelect[1] = getIndex(this)
		        	  }
		        	  selectItemNum++
		        	  
	        	  }else{
	        		  alert('최대 4시간까지 예약 가능합니다.')
	        	  }
	          }else{
	        	  this.classList.remove('list-group-item-danger')
	        	  this.classList.add('list-group-item-primary')
	        	  if(this.value == 1){
	   	       	  	total -= weekly
	          	  }else{
	          		total -= nighttime
	          	  }
	        	  
	        	  for(let i = 0; i<timeSelect.length; i++){
	        		  if(timeSelect[i] == getIndex(this)){
	        			  timeSelect.splice(i,1);
	        			  i--;
	        		  }
	        	  }
	        	  selectItemNum--;
	          }
	        	  div.innerHTML = total+'원'+ '<input type="hidden" id = "totalPrice" name = "totalPrice" value="'+ total+'" />';
	        	  timeSelect.sort(function(a, b)  {
	        		  if(a > b) return 1;
	        		  if(a === b) return 0;
	        		  if(a < b) return -1;
	        		});
	        	  timeInput.setAttribute('value', timeSelect);	
	
	 }
	})
	
</script>

<c:set var = "totalPrice" value="100"/>
<%-- <a href="ModifyForm?id=${dto.id }&page=${nowPage}">수정</a> --%>
<%-- 			<a href="DeleteForm?id=${dto.id }&page=${nowPage}">삭제</a> --%>
			
			
    <div class="row border-dark border-bottom" style="margin-bottom:30px">
      <h1>구장 상세정보</h1>
    </div>
    <div class="row" style="margin-bottom:10px">
    	<c:if test="${User.grade==1 }">
            <div class="col text-end" >
            	<a href="ModifyForm?id=${dto.id }&page=${nowPage}&dateSet=${dateSet }"><button type="button" class="btn btn-outline-secondary">수정</button></a>
            	<a href="DeleteForm?id=${dto.id }&page=${nowPage}&dateSet=${dateSet }"><button type="button" class="btn btn-outline-secondary">삭제</button></a>
            </div>
        </c:if>
    </div>
<form action="ReservationForm" method="post">
      <input type="hidden" name = "id" value="${dto.id }" />
    <div class="container border border-3 rounded">
        <div class="row">
          <div class="container text-center" id="img_big">
              <img src="<c:url value="/uploadFile/gym/basketball/${fn:split(dto.img, ',')[0]}"/>" alt="${dto.sname }" style="width: 980px; height: 600px;">
          </div>
          <div id="img_sm" style="margin-top:20px; height:250px; white-space:nowrap; overflow: auto;">
            <c:forTokens items ="${dto.img }" delims = "," var = "imagedata" varStatus="no">
	            <img src="<c:url value="/uploadFile/gym/basketball/${imagedata}"/>" alt="" style="width: 200px; height: 200px;">
			</c:forTokens>
          </div>
        </div>
        
        <div class="row" style="margin-top: 50px; margin-left: 20px;">
          <p class=" fs-2 fw-bold  ">${dto.sname }</p>
        </div>
        <div class="row border-bottom text-center" style=" margin: 0px;">
          <div class="col">
            <img src="<c:url value="/images/bas.png"/>" alt="" style="width: 500px; height: 400px;">
          </div>
          <div class="col">
            <div class="row" style="margin-top: 50px;">
              <div class="col" style="margin: 0px; padding:0px">
              	<c:choose>
              		<c:when test="${dto.option1 }">
              			<img src="<c:url value="/images/option1.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">샤워실 <br>있음</div>
              		</c:when>
              		<c:otherwise>
              			<img src="<c:url value="/images/option1_f.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">샤워실 <br>없음</div>
              		</c:otherwise>
              	</c:choose>
              </div>
              
              <div class="col" style="margin: 0px; padding:0px">
              	<c:choose>
              		<c:when test="${dto.option2 }">
              			<img src="<c:url value="/images/option2.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">주차장 <br>있음</div>
              		</c:when>
              		<c:otherwise>
              			<img src="<c:url value="/images/option2_f.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">주차장 <br>없음</div>
              		</c:otherwise>
              	</c:choose>
              </div>
              
              <div class="col" style="margin: 0px; padding:0px">
              	<c:choose>
              		<c:when test="${dto.option3 }">
              			<img src="<c:url value="/images/option3.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">냉/난방시설 <br>있음</div>
              		</c:when>
              		<c:otherwise>
              			<img src="<c:url value="/images/option3_f.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">냉/난방시설 <br>없음</div>
              		</c:otherwise>
              	</c:choose>
              </div>
              
              <div class="col" style="margin: 0px; padding:0px">
              	<c:choose>
              		<c:when test="${dto.option4 }">
              			<img src="<c:url value="/images/option4.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">정수기 <br>있음</div>
              		</c:when>
              		<c:otherwise>
              			<img src="<c:url value="/images/option4_f.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">정수기 <br>없음</div>
              		</c:otherwise>
              	</c:choose>
              </div>
              
              <div class="col" style="margin: 0px; padding:0px">
              	<c:choose>
              		<c:when test="${dto.option5 }">
              			<img src="<c:url value="/images/option5.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">마룻바닥 <br>있음</div>
              		</c:when>
              		<c:otherwise>
              			<img src="<c:url value="/images/option5_f.png"/>" alt="" style="width: 110px;">
                		<div class="text-center fs-5 fw-bold" style="margin-top: 10px;">마룻바닥 <br>없음</div>
              		</c:otherwise>
              	</c:choose>
              </div>
            </div>
            
            <div class="row border-top border-dark" style="margin-top:10px; padding-top:20px">
              <div class="text-start fs-5 fw-bold">[예약비용](2시간 기준)</div>
              <div class="row fs-5" style="margin-top: 5px; margin-left: 3px;">
                  평일 주간 : <fmt:formatNumber value="${dto.price_weekday_weekly }" />원 /  평일 야간 : <fmt:formatNumber value="${dto.price_weekday_nighttime }" />원
                  <br>
                  주말 주간 : <fmt:formatNumber value="${dto.price_weekend_weekly }" />원 /  주말 야간 : <fmt:formatNumber value="${dto.price_weekend_nighttime }" />원
              </div>
            </div>
          </div>
        </div>
        <div class="row" style="margin-top:20px; padding-left: 30px; padding-right:50px">
          <div class="col text-end fs-3 fw-bold">
            <input class="text-center" type="text" name="dateSet" id="dateSet" class="ts" autocomplete="off" value="${param.dateSet }" />
            <script>
					var setDate=null;
					$(function(){
						$('#dateSet').datepicker({
							lang:'ko',
							dateFormat: 'yy-mm-dd',
							monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
					        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip
					        dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
					        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일 Tooltip
					        minDate:0,
					        maxDate:'+2M',
					        onSelect: function(dateText, inst){
					        	
					        	var arr = dateText.split("/")
					        	var date = arr[0]
					        	location.href="Detail?id=${dto.id }&page=${nowPage }&dateSet="+date;
					        }
						});
					})
			</script> 
          </div>
        </div>

        <div class="row">
          <div class="col" style="padding-right:50px; padding-left: 50px; padding-top:20px; padding-bottom: 20px;">
            <div class="row">
              <div>
                <ul class="list-group list-group-horizontal-xl" style="margin-bottom:5px">
                    <li class="list-group-item list-group-item-primary" style="margin-right: 5px;"></li>
                    <li style="margin-right: 10px;">예약가능</li>
                    <li class="list-group-item list-group-item-secondary"style="margin-right: 5px;"></li>
                    <li style="margin-right: 10px;">예약불가</li>
                    <li class="list-group-item list-group-item-danger"style="margin-right: 5px;"></li>
                    <li >선택</li>
                </ul>
              </div>
            </div>

            <div class="row text-center" >
              <ul class="list-group list-group-horizontal-xl" id ="resTime_list">
                <li value="0" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="0" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="0" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="1" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="1" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="1" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="1" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="1" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="1" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="0" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="0" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
                <li value="0" class="list-group-item list-group-item-primary" style="width: 95px; height: 30px;"></li>
              </ul>
            </div>
            <div class="row text-center fw-bold" >
              <input type="hidden" name = "timeSelect" id="timeSelect" />
              <ul class="list-group list-group-horizontal-xl">
                <li style="width: 95px;">00~02</li>
                <li style="width: 95px;">02~04</li>
                <li style="width: 95px;">04~06</li>
                <li style="width: 95px;">06~08</li>
                <li style="width: 95px;">08~10</li>
                <li style="width: 95px;">10~12</li>
                <li style="width: 95px;">12~14</li>
                <li style="width: 95px;">14~16</li>
                <li style="width: 95px;">16~18</li>
                <li style="width: 95px;">18~20</li>
                <li style="width: 95px;">20~22</li>
                <li style="width: 95px;">22~24</li>
              </ul>
            </div>
          </div>

        </div>
        <div class="row" style="margin-top:10px; padding-right: 50px;">
          <div class="col text-end fs-3 fw-bold">
            가격
          </div>

        </div>
        <div class="row" style="margin-top:10px; padding-right: 50px;">
          <div class="col text-end fs-3 fw-bold">
            <div id ="pricediv">0</div> 
          </div>
        </div>
        <div class="row" style="margin-top:10px; padding-right: 50px;">
          <div class="col text-end">
            <button type="submit" class="btn btn-outline-primary fs-3" style="width: 300px;"> 예약하기</button>
          </div>
        </div>
        <hr>
        <div class="row" style="padding-left: 30px; padding-right:50px">
          <div class="fs-4 fw-bold">[안내 사항]</div>
          <div class="fs-5" style="height: 500px;"> ${dto.contentsBr_info }</div>
        </div>
        <div class="row" style="padding-left: 30px; padding-right:50px">
          <div class="fs-4 fw-bold">[상세 정보]</div>
          <div class="fs-5" style="height: 500px;"> ${dto.contentsBr_detail }</div>
        </div>
        <div class="row" style="padding-left: 30px; padding-right:50px">
          <div class="fs-4 fw-bold">[이용 규칙]</div>
          <div class="fs-5" style="height: 500px;"> ${dto.contentsBr_rule }</div>
        </div>
        <div class="row" style="padding-left: 30px; padding-right:50px">
          <div class="fs-4 fw-bold">[구장 환불 규정]</div>
          <div class="fs-5" style="height: 500px;"> ${dto.contentsBr_refund }</div>
        </div>
        <div class="row" style="padding-left: 30px; padding-right:50px">
          <div class="fs-4 fw-bold">주소</div>
          <div class="fs-5 fw-bold" style="margin-top:10px">${dto.address } <button type="button" onclick="goMap()" class="btn btn-outline-primary">길찾기</button></div>
          <div id="map" style="width:700px;height:400px; margin-top:10px; margin-bottom:20px"></div>
          <script>
			var lat = 0;
			var lng = 0;
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${dto.address}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
					lat = result[0].y;
					lng = result[0].x;
					
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.sname}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});  
			
			function setCenter() {            
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new kakao.maps.LatLng(lat, lng);
			    
			    // 지도 중심을 이동 시킵니다
			    map.setCenter(moveLatLon);
			}

			function panTo() {
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new kakao.maps.LatLng(lat, lng)
			    
			    // 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.panTo(moveLatLon);            
			} 
			
			
			function goMap(){
				var url = 'https://map.kakao.com/link/to/${dto.sname},'+lat+','+lng; 
				 var win = window.open(url, '_blank');
			        win.focus();
			}
			
			</script>
        </div>
    </div>
  </form>


