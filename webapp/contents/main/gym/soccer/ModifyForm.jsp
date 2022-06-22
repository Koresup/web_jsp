<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<div class="row border-dark border-bottom" style="margin-bottom:30px">
  <h1>축구 구장 정보 수정</h1>
</div>

<form action="ModifyReg" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${dto.id }" />
	<input type="hidden" name="dateSet" value="${param.dateSet }" />
	<div class="border " style="padding: 20px; margin:20px; border-radius: 25px;">
          <div class="mb-3 row">
            <label for="title" class="col-sm-2 col-form-label text-center">구장 이름</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="title" name="sname" value="${dto.sname }" placeholder="구장 이름" required>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="content" class="col-sm-2 col-form-label text-center">안내 사항</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="contents_info" rows="10" style="resize: none;" placeholder="안내사항"  required>${dto.contents_info }</textarea>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="content" class="col-sm-2 col-form-label text-center">상세 정보</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="contents_detail" rows="10" style="resize: none;" placeholder="상세정보" required>${dto.contents_detail }</textarea>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="content" class="col-sm-2 col-form-label text-center">이용 규칙</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="contents_rule" rows="10" style="resize: none;" placeholder="이용규칙" required>${dto.contents_rule }</textarea>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="content" class="col-sm-2 col-form-label text-center" >환불 규정</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="contents_refund" rows="10" style="resize: none;" placeholder="환불규정" required>${dto.contents_refund }</textarea>
            </div>
          </div>

          <div class="mb-3 row">
            <label for="addImg" class="col-sm-2 col-form-label text-center">옵션</label>
            <div class="col-sm-10 fs-5">
              <input class="form-check-input" type="checkbox" value="true" <c:if test="${dto.option1}">checked</c:if> id="option1" name = "option1">
               <label class="form-check-label" for="option1">샤워장</label>
              <input class="form-check-input" type="checkbox" value="true" <c:if test="${dto.option2}">checked</c:if> id="option2" name = "option2">
               <label class="form-check-label" for="option2">주차장</label>
              <input class="form-check-input" type="checkbox" value="true" <c:if test="${dto.option3}">checked</c:if> id="option3" name = "option3">
               <label class="form-check-label" for="option3">난방시설</label>
              <input class="form-check-input" type="checkbox" value="true" <c:if test="${dto.option4}">checked</c:if> id="option4" name = "option4">
               <label class="form-check-label" for="option4">정수기</label>
              <input class="form-check-input" type="checkbox" value="true" <c:if test="${dto.option5}">checked</c:if> id="option5" name = "option5">
               <label class="form-check-label" for="option5">잔디구장</label>
            </div>
          </div>

          <div class="mb-3 row">
            <label for="addImg" class="col-sm-2 col-form-label text-center">가격</label>
            <div class="col-sm-10">
              <div class="row">
                <div class="col-sm-2 text-center">
                  <label for="" class="col-form-label text-center">평일 주간</label>
                </div>
                <div class="col">
                  <input type="number" name = "price_weekday_weekly" class="form-control" value="${dto.price_weekday_weekly }" required>
                </div>
                <div class="col-sm-2 text-center">
                  <label for="" class=" col-form-label text-center">평일 야간</label>
                </div>
                <div class="col">
                  <input type="number" name = "price_weekday_nighttime" class="form-control" value="${dto.price_weekday_nighttime }" required>
                </div>
              </div>
              <div class="row" style="margin-top:10px">
                <div class="col-sm-2 text-center">
                  <label for=""  class="col-form-label text-center">주말 주간</label>
                </div>
                <div class="col">
                  <input type="number" name = "price_weekend_weekly" class="form-control" value="${dto.price_weekend_weekly }" required>
                </div>
                <div class="col-sm-2 text-center">
                  <label for="" class=" col-form-label text-center">주말 야간</label>
                </div>
                <div class="col">
                  <input type="number" name = "price_weekend_nighttime" class="form-control" value="${dto.price_weekend_nighttime }" required>
                </div>
              </div>
            </div>
          </div>

          <div class="mb-3 row">
            <label for="addImg" class="col-sm-2 col-form-label text-center">주소</label>
            <div class="col-sm-10">
              <div class="row">
                <div class="col-4">
                  <input type="text" class="form-control" name="postcode" id="postcode" placeholder="우편번호" value = "${dto.postcode }"  readonly  required>
                </div>
                <div class="col-4">
                  <input type="text" class="form-control" name=address id="address" placeholder="주소" value = "${dto.address }"  readonly required>
                </div>
                <div class="col-3">
                  <button type="button" class="btn btn-outline-primary" onclick="on()">주소검색</button>
                </div>
              </div>
              <div class="row" style="margin-top:10px">
                <div class="col-4">
                  <input type="text" class="form-control" name="detailAddress" id="detailAddress" value = "${dto.address_detail }"  placeholder="상세주소" >
                </div>
                <div class="col-4">
                  <input type="text" class="form-control" name="extraAddress" id="extraAddress" placeholder="참고항목" readonly >
                </div>
              </div>
            </div>
          </div>

          <div class="mb-3 row">
            <label for="addImg" class="col-sm-2 col-form-label text-center">이미지 첨부</label>
            <div class="col-sm-10" style="width:500px">
              <input type="file" name ="img" class="form-control" id="addImg" multiple required >
            </div>
            
           	<div class="col">
            	<input style="height: 39px;"	type="text" class="input-group-text" name="imgCnt_text" value="저장된 이미지 : ${img_Cnt }개" />
            </div>
            
            <div class="col-sm-2">
            	<button type = "button" onclick="deleteImg()" class="btn btn-secondary">이미지 초기화</button>
         	 </div>
            </div>

          <div class="mb-3 row">
            <label for="addImg" class="col-sm-2 col-form-label text-center">사용 불가 시간</label>
            <div class="col-sm-10 fs-5">
                <div class="row">
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="0"/> 00시~02시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="1"/> 02시~04시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="2"/> 04시~06시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="3"/> 06시~08시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="4"/> 08시~10시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="5"/> 10시~12시</label>
                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="6"/> 12시~14시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="7"/> 14시~16시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="8"/> 16시~18시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="9"/> 18시~20시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="10"/> 20시~22시</label>
                  </div>
                  <div class="col">
                    <label><input class="form-check-input unused_time_input" type="checkbox" name = "unused_time" value="11"/> 22시~24시</label>
                  </div>
                </div>
                </div>
            </div>
          </div>

    	<div class="row text-end">
            <label for="BTN" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10" id="BTNsubmit" style="padding-right: 10px;">
              <a href="Detail?id=${dto.id }&page=${nowPage}&dateSet=${dateSet}"><button type="button" class="btn btn-outline-secondary fs-5">돌아가기</button></a>  
              <button type="submit" class="btn btn-outline-primary fs-5" style="width: 150px;">수정</button>  
            </div>
          </div>
</form>	
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	const unused_time_input = document.querySelectorAll('.unused_time_input')
	var str = '${dto.unused_time}'
	const arr = str.split(',')
	if(str.length >0){
		for(var i = 0; i<arr.length; i++){
			$(unused_time_input[arr[i]]).prop('checked',true)
		}		
	}
	
	function deleteImg() {
		var id = new Object();
		id.id = '${dto.id }';
		$.ajax({
			url : '/readytoplay/gym/soccer/UploadImgEdit_Reg',
			data : id,
			type : 'POST',
			success : function(result) {
				document.getElementsByName("imgCnt_text")[0].value = "이미지 : 0개";
			},
			error : function(e) {
				console.log(e);
			}
		})
	}
	
	function on(){
		execDaumPostcode();
		
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            var addr = ''; 
		            var extraAddr = ''; 

		            if (data.userSelectedType === 'R') { 
		                addr = data.roadAddress;
		            } else { 
		                addr = data.jibunAddress;
		            }

		            if(data.userSelectedType === 'R'){
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraAddr += data.bname;
		                }
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                if(extraAddr !== ''){
		                    extraAddr = ' (' + extraAddr + ')';
		                }
		                document.getElementById("extraAddress").value = extraAddr;
		            
		            } else {
		                document.getElementById("extraAddress").value = '';
		            }

		            document.getElementById('postcode').value = data.zonecode;
		            document.getElementById("address").value = addr;
		            document.getElementById("detailAddress").focus();
		        }
		    }).open();
		}
	}
</script>