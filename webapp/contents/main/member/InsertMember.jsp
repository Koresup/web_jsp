<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<main id="main_area">
		<div class="py-5 text-center">
			<h2>회원 가입</h2>
			<p class="lead">
				준비된 공간에서 좋은 사람들과의 즐거운 시간을 공유할 수 있는 <br>Ready To Play에 오신것을
				환영합니다.
			</p>
		</div>

		<div class="col-md-7 col-lg-8" style="margin: auto;">
			<form class="needs-validation" name="signUpForm" action="InsertReg"
				method="post" onsubmit="return authCheck();">
				<div class="row g-3">
					<div class="col-sm-9">
						<label for="input_id" class="form-label">ID</label> <input
							type="text" class="form-control" id="input_id" name="pid"
							placeholder="" value="" required> <input type="hidden"
							name="useableCheck" id="useableCheck" value="false">
					</div>

					<div class="col-sm-3">
						<label for="id_checkbtn" class="form-label">중복확인</label>
						<button class="w-100 btn btn-lg btn-primary"
							onclick="overLap_Check()" type="button" id="id_checkbtn">확인</button>
					</div>

					<div class="col-sm-6">
						<label for="input_pw" class="form-label">Password</label> <input
							type="password" class="form-control" id="input_pw" name="pw"
							placeholder="" value="" required>
						<div id="pwfeedback" class="invalid-feedback">하나 이상의 대문자와
							특수문자를 포함한 8~12자리 암호를 입력해주세요.</div>
					</div>

					<div class="col-sm-6">
						<label for="pw_check" class="form-label">Password Check</label> <input
							type="password" class="form-control" id="pw_check" placeholder=""
							value="" required>
						<div id="pwcheckfalse" class="invalid-feedback">비밀번호가 다릅니다.
						</div>
					</div>

					<div class="col-sm-6">
						<label for="input_nickname" class="form-label">닉네임</label> <input
							type="text" class="form-control" id="input_nickname"
							name="nick_name" placeholder="" value="" required>
					</div>

					<div class="col-sm-6">
						<label for="input_name" class="form-label">이름</label> <input
							type="text" class="form-control" id="input_name" name="pname"
							placeholder="" value="" required>
					</div>

					<label id="gender_title">성별</label>
					<div class="col-sm-6">
						<div class="my-2">
							<div class="form-check">
								<input id="gender_m" name="gender" value="남자" type="radio"
									class="form-check-input" checked required> <label
									class="form-check-label" for="gender_m">남자</label>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="my-2">
							<div class="form-check">
								<input id="gender_w" name="gender" value="여자" type="radio"
									class="form-check-input" required> <label
									class="form-check-label" for="gender_w">여자</label>
							</div>
						</div>
					</div>

					<div class="col-sm-3">
						<label for="telecom" class="form-label">통신사</label>
						<div class="input-group">
							<select class="form-select" id="telecom" name="telecom">
								<option selected>- 선택 -</option>
								<option value="SKT">SKT</option>
								<option value="KT">KT</option>
								<option value="LG">LG U+</option>
							</select> <input type="hidden" id="telecomcheck" value="false">
						</div>
					</div>

					<div class="col-sm-9">
						<label for="input_num" class="form-label">전화번호</label> <input
							type="text" class="form-control" id="input_num" name="phonenum"
							maxlength="11" placeholder="" value="" required>
						<div id="pNumfeedback" class="invalid-feedback">숫자를 이용한 핸드폰
							번호만 입력할 수 있습니다. ( "-" 제외 )</div>
						<input type="hidden" id="pnumcheck" value="false">
					</div>


					<div class="col-9">
						<label for="inputEmailForm" class="form-label">이메일</label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="inputEmailForm"
								name="email1" maxlength="30" placeholder="Username"
								aria-label="Username"> <span class="input-group-text">@</span>
							<select class="form-select" id="selectEmailForm" name="email2">
								<option selected value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
						<div class="invalid-feedback">이메일 인증이 필요합니다.</div>
					</div>

					<div class="col-sm-3">
						<label for="eamilAuthBtn" class="form-label">이메일 인증</label>
						<button class="w-100 btn btn-lg btn-primary"
							onclick="emailAuthentication()" type="button" id="eamilAuthBtn">메일
							전송</button>
					</div>

					<div class="col-sm-9">
						<label for="authCode" class="form-label">인증번호 입력</label> <input
							type="text" class="form-control" id="authCode" name="authCode"
							placeholder="" value="" required>
					</div>

					<div class="col-sm-3">
						<label for="authCodeCheckBtn" class="form-label">인증번호 확인</label>
						<button class="w-100 btn btn-lg btn-primary"
							onclick="authCodeCheck()" type="button" id="authCodeCheckBtn">인증</button>
						<input type="hidden" name="authPass" id="authPass" value="false">
					</div>

					<label for="address" class="form-label">주소</label>
					<div class="col-5">
						<input type="text" class="form-control" id="address"
							name="address" placeholder="주소" value="" readonly> <input
							type="text" class="form-control" id="detailAddress"
							name="detailAddress" placeholder="상세주소" value="">
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="postcode"
							name="postcode" placeholder="우편번호" value="" readonly> <input
							type="text" class="form-control" id="extraAddress"
							name="extraAddress" placeholder="참고사항" value="" readonly>
					</div>
					<div class="col-sm-3">
						<button class="w-100 btn btn-lg btn-primary" onclick="on()"
							type="button" id="authCodeCheckBtn">우편번호 찾기</button>
					</div>

				</div>
				<hr class="my-4">

				<button class="w-100 btn btn-primary btn-lg" type="submit">회원가입
					완료</button>
			</form>
		</div>
	</main>
</div>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
const form = document.signUpForm;


$('#input_num').on('propertychange change paste input', function(){
	var input_num= document.getElementById("input_num").value;
	
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

$('#input_pw').on('propertychange change paste input', function(){
	var input_pw= document.getElementById("input_pw").value;
	if(!pwValCheck(input_pw)){
		$('#pwfeedback').css("display","block");
	} else if(pwValCheck(input_pw)){
		$('#pwfeedback').css("display","none");
	} 
});

$('#pw_check').on('propertychange change paste input', function(){
	var input_pw= document.getElementById("input_pw").value;
	var pw_check= document.getElementById("pw_check").value;
	if(input_pw != pw_check){
		$('#pwcheckfalse').css("display","block");
	} else if(input_pw == pw_check){
		$('#pwcheckfalse').css("display","none");
	} 
});


function overLap_Check(){
	var inputId = form.input_id.value;

	var userId =  new Object();
		userId.pid = inputId;
        	  
	$.ajax({
		url:'/readytoplay/member/OverLap_Check',
		data:userId,
		type:'POST',
		async: false,
		success: function(result){
			console.log(result)
			if(result=="false"){
				alert("이미 사용중인 아이디 입니다.")
			} else if(result=="null"){
				alert("아이디를 입력 해주세요")
			} else if(result=="true"){
				alert("사용가능한 아이디 입니다.")
				document.getElementById("useableCheck").value=true;
			}
			
		},
		error:function(e){
			console.log(e);
		}
  })
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

function authCheck(){	/* 인증 유효성검사 */
	var email = document.getElementById("authPass").value;
	var id = document.getElementById("useableCheck").value;
	var pw = document.getElementById("input_pw").value;
	var phone = document.getElementById("pNumCheck").value;
	var telecom = document.getElementById("telecomcheck").value;
	
	if(email=="true" && id=="true" && pwValCheck(pw) && phone=="true" && telecom=="true"){
		return true
	} else if(id=="false"){
		alert("아이디 중복 검사가 되지 않았습니다.")
		return false;
	} else if(!pwValCheck(pw)){
		alert("비밀번호 양식을 지켜주세요")
		return false;
	} else if(telecom=="false"){
		alert("통신사를 선택해주세요")
		return false;
	} else if(phone=="false"){
		alert("핸드폰 번호 확인 후 다시 입력해주세요.")
		return false;
	} else if(email=="false"){
		alert("이메일 인증을 해주세요")
		return false;
	} 
}

function emailAuthentication(){
	if (!emailValCheck()){
    	return false;
    }

  	var email = form.email1.value + "@" +form.email2.value;
    // console.log(email)
	var userData =  new Object();
        	  userData.email = email;
        	  userData.requestPage = "InsertMember";
	$.ajax({
		url:'/readytoplay/cert/MailReg',
		data:userData,
		type:'POST',
		success: function(result){
			console.log(userData)
		},
		error:function(e){
			console.log(e);
		}
  })
}

function emailValCheck(){
	var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = form.email1.value + "@" +form.email2.value;
	if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
		return false;
	}
    return true;
}

function pwValCheck(asValue) {
	
	var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

function pNumValCheck(asValue) {
	var regExp = /^01(0|1[6-9])(\d{3,4})(\d{4})$/;
	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
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
	var url = "/readytoplay/cert/authCodeCheck?inputedCode=" + document.signUpForm.authCode.value;
	open(url, "confirm",
			"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
}

</script>