<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
    <link rel="stylesheet" href="/webProjectTest/css/lesson_bas_modify.css">
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
        #uploader {
        	margin: 0 auto;
        }

    </style>

<form action="ModifyReg" method="post" enctype="multipart/form-data">
<input type="hidden" name="post_id" value="${dto.post_id }"/>
<input type="hidden" name="nowPage" value="${nowPage }" />
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>

    <div id="main_wrap">
        <div>
            <h2 id="main_title">농구 레슨 글 수정</h2>
        </div>
        <hr>
        <div id="lesson_bas_detail">
            <table id="lesson_top" class="table">
                <tr>
                    <td rowspan="3" id="img_area">
                        <div id="visual_wrap">
	                        <input type="file" name="imguploader" id="imguploader" multiple required/>
                        </div>
                    </td>
                    <td>
                        <div id="info_detail">
                            <div class="info_category">
                                <select name="category" id="">
                                    <option value="기타" >=카테고리=</option>
                                    <option value="슛팅" <c:if test="${dto.category==\"슛팅\" }">selected</c:if>>슛팅</option>
                                    <option value="드리블" <c:if test="${dto.category==\"드리블\" }">selected</c:if>>드리블</option>
                                    <option value="기타" <c:if test="${dto.category==\"기타\" }">selected</c:if>>기타</option>
                                </select>
                            </div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="sname" value="${dto.sname }" required/>
                            </div>
                            <hr>
                            <!-- 옵션 이미지 -->
                            <div class="info_option">
                                <label><input type="checkbox" name = "option1" value="true" <c:if test="${dto.option1}">checked</c:if>/> 샤워장</label>
								<label><input type="checkbox" name = "option2" value="true" <c:if test="${dto.option2}">checked</c:if>/> 주차장</label>
								<label><input type="checkbox" name = "option3" value="true" <c:if test="${dto.option3}">checked</c:if>/> 냉/난방시설</label>
								<label><input type="checkbox" name = "option4" value="true" <c:if test="${dto.option4}">checked</c:if>/> 정수기</label>
								<label><input type="checkbox" name = "option5" value="true" <c:if test="${dto.option5}">checked</c:if>/> 마루바닥</label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="lesson_info">
                            <div class="detail_list">
                                <dt class="list_title">레슨시간</dt>
                                <input type="text" class="form-control" id="title" name="lesson_time" value="${dto.lesson_time }" required/>
                            </div>
                            <div class="detail_list">
                                <dt class="list_title">모집인원</dt>
                                <input type="text" class="form-control" id="title" name="max_student" value="${dto.max_student }" required/>
                            </div>
                            <div class="detail_list">
                                <dt class="list_title">비용</dt>
                                <input type="text" class="form-control" id="title" name="price" value="${dto.price }" required/>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            
            <div id="lesson_bottom">
                <div class="outter">
                    <div class="bottom_name address">[주소]</div>
                    <div>
                        <p class="bottom_content">
                            <div>
	                        <p class="bottom_content">
	                            <input type="text" name="postcode" id="postcode" placeholder="우편번호" value = "${dto.postcode }"readonly>
					   			<input type="button" onclick="on()" value="우편번호 찾기"><br><br />
							    <input type="text" name="address" id="address" placeholder="주소" value="${dto.address }" required readonly><br><br />
							    <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${dto.address_detail }">
							    <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" readonly>
	                        </p>
                    </div>
                    </div>
                    <div>
                        <!-- <div><a href="https://map.kakao.com/link/to/33.919067,-118.118731" style="color:blue" target="_blank"><button>길찾기</button></a></div> -->
                        <div id="map" style="width:500px;height:400px;"></div>
                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5055bae492acc70f48ba8a992e50a421&libraries=services
                                    			"></script>
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
                            geocoder.addressSearch('${dto.address}', function (result, status) {

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
                        </script>
                    </div>
                </div>
                <div class="outter">
                    <div class="bottom_name info">[안내사항]</div>
                    <div><p class="bottom_content"> 
                        <textarea name="contents_info" cols="100" rows="10" style="resize:none;" required>${dto.contents_info }</textarea>
                       </p></div>
                </div>            
                <div class="outter">
                    <div class="bottom_name detail">[상세정보]</div>
                    <div class=""><p class="bottom_content">
                        <textarea name="contents_detail" cols="100" rows="10" style="resize:none;" required>${dto.contents_detail }</textarea>
                    </p></div>
                </div>            
                <div class="outter">
                    <div class="bottom_name rule">[이용규칙]</div>
                    <div><p class="bottom_content">
                        <textarea name="contents_rule" cols="100" rows="10" style="resize:none;" required>${dto.contents_rule }</textarea>
                    </p></div>
                </div>            
                <div class="outter">
                    <div class="bottom_name refund">[환불규정]</div>
                    <div>
                        <p class="bottom_content">
                            <textarea name="contents_refund" cols="100" rows="10" style="resize:none;" required>${dto.contents_refund }</textarea>
                        </p>
                    </div>
                </div>         
                <div class="bottom_button">
                		<a href="<c:url value="/lesson/bas/List"/>"><button>목록으로</button></a>
						<input type="reset" value="초기화" />
						<input type="submit" value="수정" />
						<input type="hidden" value="${nowPage }" name="nowPage"/>
                </div>
            </div>
        </div>
    </div>
</form>

 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
const form = document.signUpForm;
var requrl = '<c:url value="/cert/MailReg"/>'
function on(){
	execDaumPostcode();
	
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
}


function check(pattern, taget, message) {
	if(pattern.test(taget)) {
    	return true;
    }
    alert(message);
    taget.focus();
    return false;
}
function authCodeCheck(){
	
	var url = '<c:url value="/cert/authCodeCheck"/>?inputedCode=' + document.signUpForm.authCode.value;
	open(url, "confirm",
			"toolbar=no, address=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
}
</script>