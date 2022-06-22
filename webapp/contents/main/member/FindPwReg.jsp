<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="canonical"
   href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<link href="/readytoplay/css/findpw_reg.css" rel="stylesheet">

<div id="main_area">
   <div id="main_container">
      <form action="PwChange" method="post" onsubmit="return authCheck();">
         <div id="input_area">
            <div class="form-floating">
               <p>새로운 비밀번호를 입력해주세요</p>
               <input type="password" class="form-control" id="input_pw" name="pw" required>
               <div id="pwfeedback" class="invalid-feedback">하나 이상의 대문자와
                  특수문자를 포함한 8~12자리 암호를 입력해주세요.</div>
            </div>
         </div>
         <div id="next_btn">
            <button class="w-100 btn btn-lg btn-primary" type="submit">다음</button>
            <input type="hidden" name="email" value="${email }" /> <input
               type="hidden" name="memberkind" value="${memberkind }" />
         </div>
      </form>
   </div>
</div>
<script>
$('#input_pw').on('propertychange change paste input', function(){
   var input_pw= document.getElementById("input_pw").value;
   if(!pwValCheck(input_pw)){
      $('#pwfeedback').css("display","block");
   } else if(pwValCheck(input_pw)){
      $('#pwfeedback').css("display","none");
   } 
});

function pwValCheck(asValue) {
   
   var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
   return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}
function authCheck(){
   var pw = document.getElementById("input_pw").value;
   
   if(!pwValCheck(pw)){
      alert("비밀번호 양식을 지켜주세요")
      return false;
   }
   return true;
}
</script>