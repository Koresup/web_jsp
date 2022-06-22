<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/readytoplay/css/membersign.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<div class="container">
	<div class="row border-dark border-bottom" style="margin-bottom: 20px">
		<h1>개인회원 정보 수정</h1>
	</div>
	
	
	<div class="row g-5">
	<jsp:include page="../sideMenu.jsp" />
		<div class="col-md-6 col-lg-8">
			<form class="needs-validation" name="signUpForm"
				action="MemberEdit_Reg" method="post" onsubmit="return authCheck();">
				<div class="row g-3">
					<div class="col-sm-12">
						<label for="input_id" class="form-label">ID</label> <input
							type="text" class="form-control" id="input_id" name="pid"
							value="${user_data.pid }" required readonly>
					</div>
				</div>
				<div class="row" style="margin-top: 20px">
					<div class="col-sm-12">
						<label for="input_pw" class="form-label">Password</label> <input
							type="password" class="form-control" id="input_pw" name="pw"
							value="${User.pw }" required readonly>
					</div>
				</div>
				<div class="row" style="margin-top: 20px">
					<div class="col-sm-12">
						<label for="input_name" class="form-label">이름</label> <input
							type="text" class="form-control" id="input_name" name="pname"
							value="${User.pName }" required readonly>
					</div>
				</div>

				<div class="row" style="margin-top: 20px">
					<div class="col-sm-12">
						<label for="input_nickname" class="form-label">닉네임</label> <input
							type="text" class="form-control" id="input_nickname"
							name="nick_name" value="${User.nick_name }" required>
					</div>
				</div>

				<div class="row" style="margin-top: 20px">
					<label id="gender_title">성별</label>
					<div class="col-sm-9">
						<div class="my-2">
							<div class="form-check">
								<input id="gender_m" name="gender" value="남자" type="radio"
									class="form-check-input" required
									<c:if test="${User.gender == \"남자\"}">checked</c:if>>
								<label class="form-check-label" for="gender_m">남자</label>
							</div>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="my-2">
							<div class="form-check">
								<input id="gender_w" name="gender" value="여자" type="radio"
									class="form-check-input" required
									<c:if test="${User.gender == \"여자\"}">checked</c:if>>
								<label class="form-check-label" for="gender_w">여자</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 20px">
					<div class="col-sm-3">
						<label for="telecom" class="form-label">통신사</label>
						<div class="input-group">
							<select class="form-select" id="telecom" name="telecom">
								<option selected>- 선택 -</option>
								<option value="SKT" <c:if test="${User.telecom == \"SKT\"}">selected</c:if>>SKT</option>
								<option value="KT" <c:if test="${User.telecom == \"KT\"}">selected</c:if>>KT</option>
								<option value="LG" <c:if test="${User.telecom == \"LGU+\"}">selected</c:if>>LG U+</option>
							</select> <input type="hidden" id="telecomcheck" value="false">
						</div>
					</div>

					<div class="col-sm-9">
						<label for="input_num" class="form-label">전화번호</label> <input
							type="text" class="form-control" id="input_num" name="phonenum"
							maxlength="11" placeholder="" value="${User.phoneNum }" required>
						<div id="pNumfeedback" class="invalid-feedback">숫자를 이용한 핸드폰
							번호만 입력할 수 있습니다. ( "-" 제외 )</div>
						<input type="hidden" id="pnumcheck" value="false">
					</div>
				</div>
				<div class="row" style="margin-top: 20px">
					<div class="col-12">
						<label for="inputEmailForm" class="form-label">이메일</label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="inputEmailForm"
								name="email1" maxlength="30" placeholder="Username"
								aria-label="Username" value="${email }"> <span
								class="input-group-text">@</span> <select class="form-select"
								id="selectEmailForm" name="email2">
								<option value="google.com"
									<c:if test="${email_address == \"gmail.com\" }"> selected</c:if>>gmail.com</option>
								<option value="naver.com"
									<c:if test="${email_address == \"naver.com\" }"> selected</c:if>>naver.com</option>
								<option value="nate.com"
									<c:if test="${email_address == \"nate.com\" }"> selected</c:if>>nate.com</option>
							</select>
						</div>
						<div class="invalid-feedback">이메일 인증이 필요합니다.</div>
					</div>
				</div>
				<div class="row" style="margin-top: 20px">
					<label for="address" class="form-label">주소</label>
					<div class="col-4">
						<input type="text" class="form-control" id="postcode"
							name="postcode" placeholder="우편번호" value="" disabled> <input
							type="text" class="form-control" id="extraAddress"
							name="extraAddress" placeholder="참고사항" value="" readonly>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="address"
							name="address" placeholder="주소" value="${User.address }" readonly>
						<input type="text" class="form-control" id="detailAddress"
							name="detailAddress" placeholder="상세주소" value="${User.detailAddress }">
					</div>
					<div class="col-sm-4">
						<button class="w-100 btn btn-lg btn-primary" onclick="on()"
							type="button" id="authCodeCheckBtn">우편번호 찾기</button>
					</div>
				</div>
				<hr class="my-4">
				<button class="w-100 btn btn-primary btn-lg" type="submit">정보수정
					완료</button>
			</form>
		</div>
	</div>
</div>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

$('#input_num').on('propertychange change paste input', function(){
	var input_num= document.getElementById("input_num").value;
	console.log("ddd")
	if(!pNumValCheck(input_num)){
		$('#pNumfeedback').css("display","block");
		document.getElementById("pnumcheck").value = false;
	} else if(pNumValCheck(input_num)){
		$('#pNumfeedback').css("display","none");
		document.getElementById("pnumcheck").value = true;
	}
})

$('#telecom').on('propertychange change paste input', function(){
	var telecom= document.getElementById("telecom").value;
	
	if(telecom == "- 선택 -"){
		document.getElementById("telecomcheck").value = false;
	} else {
		document.getElementById("telecomcheck").value = true;
	}
})

function authCheck(){	/* 인증 유효성검사 */
	var phone = document.getElementById("pNumCheck").value;
	var telecom = document.getElementById("telecomcheck").value;
	
	if(phone=="true" && telecom=="true"){
		return true
	} else if(telecom=="false"){
		alert("통신사를 선택해주세요")
		return false;
	} else if(phone=="false"){
		alert("핸드폰 번호 확인 후 다시 입력해주세요.")
		return false;
	} 
}

function pNumValCheck(asValue) {
	var regExp = /^01(0|1[6-9])(\d{3,4})(\d{4})$/;
	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

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


</script>