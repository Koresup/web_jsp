<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/readytoplay/css/market_detail.css">

<div id="main_area">
	<div id="product_header">
		<header>
			<h1>${post_dto.title }</h1>
		</header>
		<div id="post_id">작성자 : ${post_dto.user_id }</div>
		<div id="reg_date">
			작성일자 :
			<fmt:formatDate value="${post_dto.reg_date }" pattern="yy-MM-dd HH:mm" />
			<input type="hidden" id="reg_date_${post_dto.post_id }"
				value="${post_dto.reg_date }" />
		</div>
	</div>

	<table id="product_info" class="table">
		<tr>
			<td rowspan="3" id="img_area">
				<div id="visual_wrap">
					<div id="visual_inner">
						<ul id="visual_list">
							<c:choose >
								<c:when test="${post_dto.img == null || post_dto.img == \"\"}">
									<li><img src="<c:url value="/images/nullImg.png"/>" alt="" /></li>
								</c:when>
								<c:otherwise>
									<c:forTokens items="${post_dto.img }" delims="," var="ee" varStatus="no">
										<li><img src="<c:url value="/uploadFile/market/${ee}"/>" alt="" /></li>
									</c:forTokens>
								</c:otherwise>
							</c:choose>
						</ul>
						<span id="prev_btn"></span> <span id="next_btn"></span>
					</div>
				</div>
			</td>
			<td style="">
				<div id="info_detail">
					<div class="info_category">${post_dto.l_category }>
						${post_dto.s_category }</div>
					<div class="info_title">${post_dto.title }</div>
					<div class="info_user_info">
						<p>판매자 아이디 : ${post_dto.user_id }</p>
						<p>판매자 이메일 : ${post_dto.user_email }</p>
						<p>판매자 전화번호 : ${post_dto.user_num }</p>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="product_detail">
					<div class="detail_list">
						<dt class="list_title">상품 상태</dt>
						<dd class="list_detail">${post_dto.check_quality }</dd>
					</div>
					<div class="detail_list">
						<dt class="list_title">거래 방법</dt>
						<dd class="list_detail">${post_dto.delivery }</dd>
					</div>
				</div>
				<div id="product_state">판매중</div>
			</td>
		</tr>
		<tr>
			<td><p id="product_price">가격 : ${post_dto.price }</p></td>
		</tr>
	</table>
	<div id="safe_info">
		<img id="safe_img" src="/readytoplay/images/safe.png" alt="">
		<p id="safe_text">
			1. 구매문의는 댓글이나 전화 등을 이용해 연락하고 외부 메신저 이용 및 개인 정보 유출에 주의하세요. <br>
			2. 계좌이체 시 선입금을 유도할 경우 안전한 거래인지 다시 한번 확인하세요. <br> 3. 불확실한 판매자(본인
			미인증, 해외IP, 사기의심 전화번호)의 물건은 구매하지 말아주세요. <br> 4. 등록된 판매 물품과 내용은 개별
			판매자가 등록한 것으로서, 등록을 위한 시스템만 제공하며 내용에 대하여 일체의 책임을 지지 않습니다.
		</p>
	</div>
	<div id="main_text">${post_dto.content }</div>
	<table class="table">
		<tr>
			<td class="toList" colspan="2">
				<button type="button" onclick="location.href='PostList?page=${nowPage }'">목록으로</button>
			</td>
			<td class="modiNdel" colspan="2">
				<c:if test="${User.pid == dto.user_id }">
				<button type="button"
					onclick="location.href='PostModify?post_id=${post_dto.post_id }&page=${nowPage }'";>수정</button>
				<button type="button"
					onclick="location.href='PostDelete_Reg?post_id=${post_dto.post_id }&page=${nowPage }'";>삭제</button>
					</c:if>
			</td>
		</tr>
		<tr>
			<td class="comment_add" colspan="4"><textarea
					name="comment_input" id="comment_add_txtarea" cols="90" rows="5"
					style="resize: none;"></textarea><br>
				<button class="comment_addBTN" type="button"
					onclick="commentInsert()">댓글입력</button> <input type="hidden"
				name="post_id" value="${dto.post_id }" /></td>
		</tr>
	</table>
	<div id="comment_table">
		<table class="comment_table">
			<c:forEach var="comment_dto" items="${comment_dto }" varStatus="no">
				<tr>
					<!-- 댓글 내용 -->
					<td class="comment_list" colspan="4"><textarea
							name="commentList" id="input_${comment_dto.comment_id}" cols="80"
							rows="3" style="resize: none;" disabled>${comment_dto.content}</textarea>
					</td>
				</tr>
				<tr>
					<!-- 댓글 작성자 -->
					<td>${comment_dto.comment_writer } <input type="hidden"
						id="writer_${comment_dto.comment_id }"
						value="${comment_dto.comment_writer }" />
					</td>
					<!-- 댓글 작성일 -->
					<td id="comment_regdate"><input type="hidden"
						id="reg_date_${comment_dto.comment_id }" value="${comment_dto.reg_date }" /> <input
						type="hidden" id="reg_date_${comment_dto.comment_id }"
						value="${comment_dto.reg_date }" /></td>
					<!-- 댓글 수정 버튼 -->
					<td>
						<button type="button" name="commentEdit"
							idx_data="${comment_dto.comment_id}"
							onclick="commentModify(this)">수정</button>
					</td>
					<!-- 댓글 삭제 버튼 -->
					<td>
						<button type="button" idx_data="${comment_dto.comment_id}"
							onclick="commentDelete(this)">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="post_bottom"></div>
</div>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>
<script>
window.addEventListener('load', () => {
    visualSlideEffect()
})

function visualSlideEffect() {
    const visualWrap = document.querySelector('#visual_wrap')
    const visualInner = document.querySelector('#visual_inner')
    const visualList = document.querySelector('#visual_list')
    const visualLi = document.querySelectorAll('#visual_list>li')
    const visualImg = document.querySelectorAll('#visual_list>li>img')
    const btnImg = document.querySelectorAll('#visual_inner>span>img')
    const nextBtn = document.querySelector('#next_btn')
    const prevBtn = document.querySelector('#prev_btn')
    let visualWidth = visualInner.offsetWidth
    let visualLength = visualLi.length

    let timer = null;
    let currentIndex = 0
    let nextIndex = 1;

    isSlide = false;

    visualsettimg()
    init()
    autoPlay()
    initEvent()

    function initEvent() {
        window.addEventListener('resize', visualsettimg)
        nextBtn.addEventListener('click', slideVisualNext)
        prevBtn.addEventListener('click', slideVisualPrev)
        visualWrap.addEventListener('mouseenter', stopSlideVisual)
        visualWrap.addEventListener('mouseleave', autoPlay)
    }

    function stopSlideVisual() {
        clearInterval(timer)
    }

    function autoPlay() {
        timer = setInterval(slideVisualNext, 10000)
    }

    function slideVisualPrev() {
        if (isSlide == false) {
            isSlide = true;
            nextIndex = currentIndex - 1;
            if (nextIndex < 0) {
                nextIndex = visualLength - 1
            }
            gsap.to(visualLi[currentIndex], { left: visualWidth, opacity: 0, duration: 0.8, ease: 'power1.out' })
            gsap.set(visualLi[nextIndex], { left: -visualWidth })
            gsap.to(visualLi[nextIndex], {
                left: 0, opacity: 1, duration: 0.8, ease: 'power1.out', onComplete: () => {
                    isSlide = false;
                }
            })
            currentIndex = nextIndex
        }
    }

    function slideVisualNext() {
        if (isSlide == false) {
            isSlide = true;
            nextIndex = currentIndex + 1;
            if (nextIndex >= visualLength) {
                nextIndex = 0
            }
            gsap.to(visualLi[currentIndex], { left: -visualWidth, opacity: 0, duration: 0.8, ease: 'power1.out' })
            gsap.set(visualLi[nextIndex], { left: visualWidth })
            gsap.to(visualLi[nextIndex], {
                left: 0, opacity: 1, duration: 0.8, ease: 'power1.out', onComplete: () => {
                    isSlide = false;
                }
            })
            currentIndex = nextIndex
        }
    }

    function init() {
        gsap.set(visualLi, { left: visualWidth, opacity: 0 })
        gsap.set(visualLi[0], { left: 0, opacity: 1 })
    }

    function visualsettimg() {
        visualWidth = visualInner.offsetWidth;
        gsap.set(visualLi, { width: visualWidth })
        gsap.set(visualImg, { width: visualWidth })
        gsap.set(btnImg, { width: visualWidth / 20 })
        gsap.set(visualWrap, { height: visualImg[0].offsetHeight })
    }
}


function commentInsert(){
	var comment = document.getElementsByName("comment_input")[0].value;
	location.href='/readytoplay/comment/Insert?post_id=${post_dto.post_id }&page=${nowPage }&user_id=${post_dto.user_id}&comment='+comment;
}
function commentModify(me){
	var com_area = $('#input_'+$(me).attr('idx_data'))	
	
	if($(me).html()=='수정'){
		com_area.attr('disabled', false)
		$(me).html('완료');
	} else {
		com_area.attr('disabled', true)
		$(me).html('수정');

		var commentData =  new Object();
		commentData.comment_input = com_area.val();
		commentData.post_id = "${post_dto.post_id}";
		commentData.comment_id = $(me).attr('idx_data');
		commentData.writer = $('#writer_'+$(me).attr('idx_data')).val();
		commentData.reg_date = $('#reg_date_'+$(me).attr('idx_data')).val();
	        	  
		$.ajax({
			url:'/readytoplay/comment/Modify',
			data:commentData,
			type:'POST',
			success: function(result){
				alert("수정되었습니다.")
			},
			error:function(e){
				console.log(e);
			}
	  })
	}
}
function commentDelete(me){
	
	var commentData =  new Object();
		commentData.comment_id = $(me).attr('idx_data');
		
	        	  
		$.ajax({
			url:'/readytoplay/comment/Delete',
			data:commentData,
			type:'POST',
			success: function(result){
				
				location.reload();
				alert("삭제되었습니다.")
			},
			error:function(e){
				console.log(e);
			}
	  })
}

</script>