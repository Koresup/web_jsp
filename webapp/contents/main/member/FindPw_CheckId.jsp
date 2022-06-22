<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;700&display=swap" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    <link href="/readytoplay/css/findpw.css" rel="stylesheet">

<div id="main_area">
    <div id="main_container">
		<form name="findPwCertForm" action="FindPw_CertEmail" method="post">
            <div id="type_select">
                <input type="radio" class="btn-check" name="memberkind" id="option1" value="개인회원" autocomplete="off"
                    checked>
                <label class="btn btn-secondary" for="option1">개인 회원</label>
                <input type="radio" class="btn-check" name="memberkind" id="option2" value="법인회원" autocomplete="off">
                <label class="btn btn-secondary" for="option2">법인 회원</label>
            </div>
            <div id="input_area">
                <div class="form-floating">
                    <p>아이디를 입력해주세요</p>
                    <input type="text" class="form-control" id="pid" name="pid">
                </div>
            </div>
            <div id="next_btn">
                <button class="w-100 btn btn-lg btn-primary" type="submit">다음</button>
            </div>
        </form>
    </div>
</div>