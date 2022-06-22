<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/webProjectTest/css/reset.css">
<link rel="stylesheet" href="/webProjectTest/css/top.css">
<link rel="stylesheet" href="/webProjectTest/css/common.css">
<link rel="stylesheet" href="/webProjectTest/css/notice.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>
</head>
<body>
<jsp:include page= "top.jsp"/>

<div id = "contents_wrap">
	<section id="contents">
		<jsp:include page= "main/${mainUrl }.jsp"/>
	</section>
</div>

<jsp:include page= "bottom.jsp"/>

</body>
</html>