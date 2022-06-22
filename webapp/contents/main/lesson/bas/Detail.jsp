<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


 
    
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/js/bootstrap.js">
<link rel="stylesheet" href="/webProjectTest/css/lesson_bas_detail.css">

<style>
      
h2#main_title {
    margin: 20px;
}
div#main_wrap {
    width: 1243px;
    height: auto;
    margin-left: auto;
    margin-right: auto;
}
div#lesson_bas_detail {
    border: 1px solid #d7dce2;
    padding: 20px;
    margin: 20px;
    border-radius: 25px;
}
#lesson_info{
    width: 50%;
    float: left;
    border-right: 1px solid black !important; 
}
#map {
	margin: 0 auto;
}

</style>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>


<div id="main_wrap">
	<div>
	    <h2 id="main_title">농구 레슨 상세보기</h2>
	</div>
	<hr>
        <div id="lesson_bas_detail">
        <form action="<c:url value="/payment/ReservationForm"/>" method="post">
			<input type="hidden" name = "id" value="${dto.post_id }" />
			<input type="hidden" name = "manager_id" value="${dto.manager_id }" />
            <table id="lesson_top" class="table">
                <tr>
                    <td rowspan="3" id="img_area">
                        <div id="visual_wrap">
	                        <c:forTokens items ="${dto.img }" delims = "," var = "ee" varStatus="no">
								<img src="<c:url value="/uploadFile/lesson/bas/${ee}"/>" alt="" style="width: 520px; height: 410px; "/>
							</c:forTokens>
                        </div>
                    </td>
                    <td style="vertical-align: top;">
                        <div id="info_detail">
                            <div class="info_category">카테고리 : ${dto.category }</div>
                            <div class="info_title">${dto.sname }</div><hr>
                            <!-- 옵션 이미지 -->
                            <div>
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
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="lesson_info">
                            <div class="detail_list"><dt class="list_title">레슨시간</dt> <dd class="list_detail">${dto.lesson_time }</dd></div>
                           <div class="detail_list"><dt class="list_title">모집인원</dt> <dd class="list_detail">13 / ${dto.max_student }명</dd></div>
                        </div>
                        <div id="lesson_expense">${dto.price }원</div>
                    </td>
                </tr>
                <tr>
                    <td><div id="lesson_reservation"><a href=""><button type="submit" class ="btn btn-outline-secondary" style ="width:200px">신청하기</button></a></div></td>
                </tr>
            </table>
            
          <div id="lesson_bottom">
                <div class="outter">
                    <div class="bottom_name address">[주소]</div>
                    <div>
                        <p class="bottom_content">- ${dto.address } <button type="button" onclick="goMap()" class="btn btn-outline-primary">길찾기</button></p>
                    </div>
                    <div>
                        <div id="map" style="width:500px;height:400px;"></div>
                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5055bae492acc70f48ba8a992e50a421&libraries=services"></script>
                        <script> 
				var lat = 33.919067;
				var lng = -118.118731;
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.919067, -118.118731), // 지도의 중심좌표
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
                <div class="outter">
                    <div class="bottom_name info">[안내사항]</div>
                    <div><p class="bottom_content">
                        ${dto.contentsBr_info }
                    </p></div>
                </div>            
                <div class="outter">
                    <div class="bottom_name detail">[상세정보]</div>
                    <div class=""><p class="bottom_content">
                        ${dto.contentsBr_detail }
                    </p></div>
                </div>            
                <div class="outter">
                    <div class="bottom_name rule">[이용규칙]</div>
                    <div><p class="bottom_content">
                        ${dto.contentsBr_rule }
                    </p></div>
                </div>            
                <div class="outter">
                    <div class="bottom_name refund">[환불규정]</div>
                    <div>
                        <p class="bottom_content">
                           ${dto.contentsBr_refund }>
                        </p>
                    </div>
                </div>
                <div class="outter">
                    <div class="bottom_name corp_name">[매니저]</div>
                    <div><p class="bottom_content">${dto.manager_id }</p></div>
                </div>            
                <div class="bottom_button">
                	<a href="<c:url value="/lesson/bas/List?page=${nowPage }"/>"><button type="button" class ="btn btn-outline-secondary" >목록으로</button></a>
                    <c:if test="${User.grade == 1 }">
                    <a href="<c:url value="/lesson/bas/ModifyForm?post_id=${dto.post_id }&page=${nowPage }"/>"><button type="button" class ="btn btn-outline-secondary">수정</button></a>
                    <a href="<c:url value="/lesson/bas/DeleteForm?post_id=${dto.post_id }&page=${nowPage }"/>"><button type="button" class ="btn btn-outline-secondary">삭제</button></a>
                    </c:if>
                </div>
            </div>
            </form>
        </div>
    </div>

</body>
<script>
    window.addEventListener('load', () => {
        visualSlideEffect()
    })

    function visualSlideEffect() {
        const visualWrap = document.querySelector('#visual_wrap')
        const visualInner = document.querySelector('#visual_inner')
        const visualList = document.querySelector('#visual_list')
        const visualLi = document.querySelectorAll('#visual_list>li')
        const visualImg = document.querySelectorAll('#visual_list>li>img')
        const btnImg = document.querySelectorAll('#visual_inner>span>img')
        const nextBtn = document.querySelector('#next_btn')
        const prevBtn = document.querySelector('#prev_btn')
        let visualWidth = visualInner.offsetWidth
        let visualLength = visualLi.length

        let timer = null;
        let currentIndex = 0
        let nextIndex = 1;

        isSlide = false;

        visualsettimg()
        init()
        autoPlay()
        initEvent()

        function initEvent() {
            window.addEventListener('resize', visualsettimg)
            nextBtn.addEventListener('click', slideVisualNext)
            prevBtn.addEventListener('click', slideVisualPrev)
            visualWrap.addEventListener('mouseenter', stopSlideVisual)
            visualWrap.addEventListener('mouseleave', autoPlay)
        }

        function stopSlideVisual() {
            clearInterval(timer)
        }

        function autoPlay() {
            timer = setInterval(slideVisualNext, 10000)
        }

        function slideVisualPrev() {
            if (isSlide == false) {
                isSlide = true;
                nextIndex = currentIndex - 1;
                if (nextIndex < 0) {
                    nextIndex = visualLength - 1
                }
                gsap.to(visualLi[currentIndex], { left: visualWidth, opacity: 0, duration: 0.8, ease: 'power1.out' })
                gsap.set(visualLi[nextIndex], { left: -visualWidth })
                gsap.to(visualLi[nextIndex], {
                    left: 0, opacity: 1, duration: 0.8, ease: 'power1.out', onComplete: () => {
                        isSlide = false;
                    }
                })
                currentIndex = nextIndex
            }
        }

        function slideVisualNext() {
            if (isSlide == false) {
                isSlide = true;
                nextIndex = currentIndex + 1;
                if (nextIndex >= visualLength) {
                    nextIndex = 0
                }
                gsap.to(visualLi[currentIndex], { left: -visualWidth, opacity: 0, duration: 0.8, ease: 'power1.out' })
                gsap.set(visualLi[nextIndex], { left: visualWidth })
                gsap.to(visualLi[nextIndex], {
                    left: 0, opacity: 1, duration: 0.8, ease: 'power1.out', onComplete: () => {
                        isSlide = false;
                    }
                })
                currentIndex = nextIndex
            }
        }

        function init() {
            gsap.set(visualLi, { left: visualWidth, opacity: 0 })
            gsap.set(visualLi[0], { left: 0, opacity: 1 })
        }

        function visualsettimg() {
            visualWidth = visualInner.offsetWidth;
            gsap.set(visualLi, { width: visualWidth })
            gsap.set(visualImg, { width: visualWidth })
            gsap.set(btnImg, { width: visualWidth / 20 })
            gsap.set(visualWrap, { height: visualImg[0].offsetHeight })
        }
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>
  <!--GSAP CDN 코드 -->
  <script>

    document.addEventListener('DOMContentLoaded', () => {
      const grayLayer = document.createElement('div') // div요소를 맹글어라
      const overLayer = document.createElement('div')
      const body = document.querySelector('body')

      grayLayer.id = 'grayLayer'
      overLayer.id = 'overLayer' // 생성만한 단계

      const imgMenu = document.querySelectorAll('#img_list>li')

      for (const item of imgMenu) {
        item.addEventListener('click', clickImgMenu)
      }

      grayLayer.addEventListener('click', hideModalWindow)




      function clickImgMenu() {
        let clickIndex = getIndex(this)
        // alert(clickIndex)
        showModalWindow(clickIndex)
      }

      function getIndex(checkMenu) {
        let selectedIndex = 0;
        while ((checkMenu = checkMenu.previousElementSibling) != null) {
          selectedIndex++;
        }
        return selectedIndex;
      }

      function showModalWindow(index) {

        body.append(grayLayer);
        // set : 초기설정?
        gsap.set(grayLayer, { display: 'block' })
        // to : 애니메이션
        gsap.to(grayLayer, { opacity: 0.9, duration: 0.3, ease: 'power1.out' }) // duration: 0.3초, ease: gsap에서 참고하기

        body.append(overLayer);
        gsap.set(overLayer, { display: 'block' })

        
        /* 요기요 */
        overLayer.innerHTML = "<img src='/proj_04_minsoo/main/uploadFile/lesson_bas" + (index + 1) + ".jpg'>"
        overLayer.innerHTML = "<img src='/proj_04_minsoo/main/uploadFile/lesson_bas" + (index + 1) + ".jpg'>"

      }

      function hideModalWindow() {
        gsap.set(overLayer, { display: 'none' })
        gsap.to(grayLayer, {
          opacity: 0, duration: 0.3, ease: 'power1.out', onComplete: () => {
            gsap.set(grayLayer, { display: 'none' })
          }
        })
      }

    })
  </script>















<!-- <h2>레슨 상세보기</h2> -->


<!-- <table border=""> -->

<!-- 	<tr> -->
<!-- 		<td>카테고리</td> -->
<%-- 		<td>${dto.category }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>레슨명</td> -->
<%-- 		<td>${dto.sname }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>이미지</td> -->
<!-- 		<td> -->
<%-- 			<c:forTokens items ="${dto.img }" --%>
<%-- 				delims = "," var = "image" varStatus="no"> --%>
<%-- 				<img src="<c:url value="/uploadFile/lesson/bas/${image}"/>" alt="" /> --%>
<%-- 			</c:forTokens> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>info</td> -->
<%-- 		<td>${dto.contents_info }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>detail</td> -->
<%-- 		<td>${dto.contents_detail }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>rule</td> -->
<%-- 		<td>${dto.contents_rule }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>refund</td> -->
<%-- 		<td>${dto.contents_refund }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>비용</td> -->
<%-- 		<td>${dto.price }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>레슨 시간</td> -->
<%-- 		<td>${dto.lesson_time }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>모집인원</td> -->
<%-- 		<td>${dto.max_student }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>주소</td> -->
<%-- 		<td>${dto.address } <br /> --%>
<!-- 			 -->
<!-- 			<div id="map" style="width:500px;height:400px;"></div> -->
<!-- 			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5055bae492acc70f48ba8a992e50a421&libraries=services -->
<!-- 			"></script> -->
<!-- 			
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>옵션</td> -->
<%-- 		<td>샤워장 : ${dto.option1 }, 주차장 : ${dto.option2 }, 냉/난방시설 : ${dto.option3 }, 정수기 : ${dto.option4 }, 마루바닥 : ${dto.option5 }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>매니저</td> -->
<%-- 		<td>${dto.manager_id }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="2"> -->
<%-- 			<a href="<c:url value="/lesson/bas/List?page=${nowPage }"/>">목록으로</a> --%>
<!-- 			<input type="submit"  value="레슨 신청"/> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="2"> -->
<%-- 			<a href="<c:url value="ModifyForm?post_id=${dto.post_id }&page=${nowPage }"/>">수정</a> --%>
<%-- 			<a href="<c:url value="DeleteForm?post_id=${dto.post_id }&page=${nowPage }"/>">삭제</a> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="4" >리뷰</td> -->
<!-- 	</tr> -->
	
<!-- </table> -->
<!-- </form> -->