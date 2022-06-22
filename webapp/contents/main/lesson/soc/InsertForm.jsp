<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <link rel="stylesheet" href="/webProjectTest/css/lesson_soc_insert.css">
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
        div#lesson_soc_detail {
            border: 1px solid #d7dce2;
            padding: 20px;
            margin: 20px;
            border-radius: 25px;
        }

    </style>
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>

<form action="InsertReg" method="post" enctype="multipart/form-data">
    <div id="main_wrap">
        <div>
            <h2 id="main_title">축구 레슨 새글</h2>
        </div>
        <hr>
        <div id="lesson_soc_insert">
            <table id="lesson_top" class="table">
                <tr>
                    <td rowspan="3" id="img_area">
                        <div id="visual_wrap">
	                        <input type="file" name="img" multiple required/>
                        </div>
                    </td>
                    <td>
                        <div id="info_insert">
                            <div class="info_category">
                                <select name="category" id="category">
                                    <option value="기타">=카테고리=</option>
                                    <option value="슛팅">슛팅</option>
                                    <option value="드리블">드리블</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="sname" id="title" placeholder="레슨명을 입력하세요." required>
                            </div>
                            <hr>
                            <!-- 옵션 이미지 -->
                            <div class="info_option">
								<div class="info_option">
                                <label><input type="checkbox" name = "option1" value="true" <c:if test="${dto.option1}">checked</c:if>/> 샤워장</label>
								<label><input type="checkbox" name = "option2" value="true" <c:if test="${dto.option2}">checked</c:if>/> 주차장</label>
								<label><input type="checkbox" name = "option3" value="true" <c:if test="${dto.option3}">checked</c:if>/> 냉/난방시설</label>
								<label><input type="checkbox" name = "option4" value="true" <c:if test="${dto.option4}">checked</c:if>/> 정수기</label>
								<label><input type="checkbox" name = "option5" value="true" <c:if test="${dto.option5}">checked</c:if>/> 잔디구장</label>
                            </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="lesson_info">
                            <div class="detail_list">
                                <dt class="list_title">레슨시간</dt>
                                <input type="text" class="form-control" name="lesson_time" id="title" placeholder="예) 매주 화 15:00-17:00" required>
                            </div>
                            <div class="detail_list">
                                <dt class="list_title">모집인원</dt>
                                <input type="text" class="form-control" name="max_student" id="title" placeholder="예) 15" required>
                            </div>
                            <div class="detail_list">
                                <dt class="list_title">비용</dt>
                                <input type="text" class="form-control" name="price" id="title" placeholder="150000" required>
                            </div>
                            <div class="detail_list">
                                <dt class="list_title">법인</dt>
                                <select class="form-select form-select-lg sm-3 text-center fs-5" name="manager_id" id="" style="width: 300px;">
				                  <option value="none">======= 법인 =======</option>
				                  <c:forEach var="mem" items="${mainData }">
									<option value="${mem }">${mem }</option>
								  </c:forEach>
				                </select>
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
                            <input type="text" name="postcode" id="postcode" placeholder="우편번호" required readonly>
				   			<input type="button" onclick="on()" value="우편번호 찾기"><br><br />
						    <input type="text" name="address" id="address" placeholder="주소" required readonly><br><br />
						    <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
						    <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" readonly>
                        </p>
                    </div>
                    
                </div>
                <div class="outter">
                    <div class="bottom_name info">[안내사항]</div>
                    <p class="bottom_content">
                        <textarea name="contents_info" cols="100" rows="10" style="resize:none;" placeholder="
                        예)
                        [ 주차 상세 ]
                        - 20대 이상 가능
                        
                        [ 대여 상세 ]
                        - 농구공 사용 가능 / 전자휘슬 / 유니폼 상하의(각 1,000원씩) /대형 전광판(24초계시기 포함)
                        
                        [ 물, 음료 ]
                        - 정규코트 4층에서는 식수만 섭취가능
                        - 물,음료 판매하고 있습니다!!
                        
                        [샤워시설]
                        최대2~3명 순차적으로 가능
                        
                       [행사 및 촬영대관]
                       관리자에게 문의요망-기본4시간
                       
                        -코트 입장시 꼭 실내 운동화 착용 필수
                        -마스크 착용 필수
                        -흡연시 꼭 외부신발로 갈아신어 주시고 건물 외부에서 흡연 부탁드립니다.
                        -체육관 이용 5분전 입장가능합니다.
                       
                        " required></textarea>
                    </p>
                </div>
                <div class="outter">
                    <div class="bottom_name detail">[상세정보]</div>
                    <p class="bottom_content">
                        <textarea name="contents_detail" cols="100" rows="10" style="resize:none;" placeholder="상세정보를 입력하세요" required></textarea>
                    </p>
                </div>
                <div class="outter">
                    <div class="bottom_name rule">[이용규칙]</div>
                
                    <p class="bottom_content">
                        <textarea name="contents_rule" cols="100" rows="10" style="resize:none;" placeholder="이용규칙을 입력하세요" required></textarea>
                    </p>
                </div>
                <div class="outter">
                    <div class="bottom_name refund">[환불규정]</div>
                
                    <p class="bottom_content">
                        <textarea name="contents_refund" cols="100" rows="10" style="resize:none;" placeholder="환불규정을 입력하세요" required></textarea>
                    </p>
                </div>
                <div class="bottom_button">
                	<a href="<c:url value="/lesson/List"/>"><button>목록으로</button></a>
                    <input type="reset" value="초기화">
                	<input type="submit" value="등록">
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
