<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ready to Play</title>

<link rel="stylesheet" href="/readytoplay/css/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Users/minsookim/Desktop/프로젝트/04_proj/r2p/readytoplay/webapp/css/common.css">

<link rel="stylesheet" href="/Users/minsookim/Desktop/프로젝트/04_proj/r2p/readytoplay/webapp/css/gym_list.css">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
.btn-primary{
  color: #fff;
  background-color: #7b9acc;
  border-color: #7b9acc;
}

.btn-primary:hover {
  color: #fff;
  background-color: #5c87cb;
  border-color: #5c87cb;
  
}

footer {
    width: 100%;
    height: 90px;
    bottom: 0px;
    border-top: 1px solid #c4c4c4;
    padding-top: 10px;
    color: #808080;
    font-size: 11px;
    
}
.foo_div {
    padding-left: 10px;
    float: left;
}
      
table#footer_table {
    float: left;
}


.footer_div1 {
    float: right;
}
footer p {
    margin-top: 0;
    margin-bottom: 0;
}

.footer_div1 span {
    font-size: 12px;
    margin-bottom: 4px;
}


img#footer_logo {
    width: 100px;
    height: auto;
}
</style>

 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  
   <!-- 차트 링크 -->
   <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<jsp:include page= "top.jsp"/>
<hr />
<div id = "contents_wrap">
	<section id="contents">
		<jsp:include page= "main/${mainUrl }.jsp"/>
	</section>
</div>

<div>
<jsp:include page= "bottom.jsp"/>
</div>
</body>
</html>