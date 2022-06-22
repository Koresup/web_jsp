<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="/readytoplay/css/market_insert.css">

<form action="PostModify_Reg" method="post" enctype="multipart/form-data">
        <div id="main_wrap">
            <div>
                <h2 id="main_title">게시글 수정하기</h2>
            </div>
            <hr>

            <div id="product_detail">
                <table id="product_top" class="table">
                    <tr>
                        <td>
                            <div id="info_detail">
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="title"
                                        placeholder="상품의 이름 또는 글의 제목을 입력하세요." name="title" value="${dto.title }">
                                	<input type="hidden" name="post_id" value="${dto.post_id }" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="product_info">
                                <div class="row detail_list" style="margin-top:20px">
                                    <div class="col-sm-6">
                                        <dt class="list_title">카테고리</dt>
                                        <div class="input-group">
                                            <select class="form-select" id="inputSelect" name="l_category">
                                                <option value="축구용품" <c:if test="${dto.l_category == \"축구용품\"}">selected</c:if>>축구용품</option>
                                                <option value="농구용품" <c:if test="${dto.l_category == \"농구용품\"}">selected</c:if>>농구용품</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <dt class="list_title">카테고리</dt>
                                        <div class="input-group">
                                            <select class="form-select" id="inputSelect" name="s_category">
                                                <option value="신발" <c:if test="${dto.s_category == \"신발\"}">selected</c:if>>신발</option>
                                                <option value="의류" <c:if test="${dto.s_category == \"의류\"}">selected</c:if>>의류</option>
                                                <option value="기타용품" <c:if test="${dto.s_category == \"기타용품\"}">selected</c:if>>기타용품</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row detail_list" style="margin-top:20px">
                                    <div class="col-sm-6">
                                        <dt class="list_title">상품 상태</dt>
                                        <div class="input-group">
                                            <select class="form-select" id="inputSelect" name="check_quality">
                                                <option value="미개봉" <c:if test="${dto.check_quality == \"미개봉\"}">selected</c:if>>미개봉</option>
                                                <option value="거의새것" <c:if test="${dto.check_quality == \"거의새것\"}">selected</c:if>>거의새것</option>
                                                <option value="사용감있음" <c:if test="${dto.check_quality == \"사용감있음\"}">selected</c:if>>사용감있음</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <dt class="list_title">거래 방법</dt>
                                        <div class="input-group">
                                            <select class="form-select" id="inputSelect" name="delivery">
                                                <option value="택배" <c:if test="${dto.delivery == \"택배\"}">selected</c:if>>택배</option>
                                                <option value="직거래" <c:if test="${dto.delivery == \"직거래\"}">selected</c:if>>직거래</option>
                                                <option value="무관" <c:if test="${dto.delivery == \"무관\"}">selected</c:if>>무관</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row detail_list" style="margin-top:20px">
                                    <div class="col-sm-12">
                                        <dt class="list_title">금액</dt>
                                        <input type="text" class="form-control" id="title" placeholder="금액을 입력하세요."
                                            name="price" value="${dto.price }">
                                    </div>
                                </div>
                                <div class="row detail_list" style="margin-top:20px">
                                    <div class="col-sm-6">
                                        <dt class="list_title">이미지</dt>
                                        <div class="input-group mb-3">
                                            <input type="file" class="form-control" id="inputGroupFile02" name="img" multiple>
                                            <label class="input-group-text" for="inputGroupFile02">Upload</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
	                                    <dt class="list_title">삭제</dt>
                                        <div class="input-group mb-3">
	                                        <input style="height: 39px;"	type="text" class="input-group-text" name="imgCnt_text" value="저장된 이미지 : ${img_Cnt }개" />
	                                        <button style="height: 39px; font-size:small;" type="button" class="btn btn-secondary btn-lg" onclick="deleteImg();">파일 삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <div id="safe_info">
                    <img id="safe_img" src="/readytoplay/images/safe.png" alt="">
                    <p id="safe_text">
                        1. 구매문의는 댓글이나 전화 등을 이용해 연락하고 외부 메신저 이용 및 개인 정보 유출에 주의하세요.
                        <br>
                        2. 계좌이체 시 선입금을 유도할 경우 안전한 거래인지 다시 한번 확인하세요.
                        <br>
                        3. 불확실한 판매자(본인 미인증, 해외IP, 사기의심 전화번호)의 물건은 구매하지 말아주세요.
                        <br>
                        4. 등록된 판매 물품과 내용은 개별 판매자가 등록한 것으로서, 등록을 위한 시스템만 제공하며 내용에 대하여 일체의 책임을 지지 않습니다.
                    </p>
                </div>
                <div class="outter">
                    <div class="bottom_name refund">[상세 설명]</div>

                    <p class="bottom_content">
                        <textarea name="content" cols="130" rows="30" style="resize:none;"
                            placeholder="판매하고자 하는 제품의 설명을 작성하세요.">${dto.content }</textarea>
                    </p>
                </div>
                <div class="bottom_button">
                    <button type="button" onclick="location.href='PostList?page=${nowPage }'">목록으로</button>
                    <input type="submit" value="수정완료" />
                </div>
            </div>
    </form>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

	function deleteImg() {
		
		var post_id = new Object();
		post_id.post_id = '${dto.post_id }';
		
		$.ajax({
			url : '/readytoplay/market/UploadImgEdit_Reg',
			data : post_id,
			type : 'POST',
			success : function(result) {
				document.getElementsByName("imgCnt_text")[0].value = "이미지 : 0개";
			},
			error : function(e) {
				console.log(e);
			}
		})
	}
</script>