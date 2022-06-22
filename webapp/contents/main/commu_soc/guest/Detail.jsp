<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>
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

div#commu_soc_guest_detail {
	border: 1px solid #d7dce2;
	padding: 20px;
	margin: 20px;
	border-radius: 25px;
}

div#comment_table {
	border: 1px solid #d7dce2;
	padding: 20px;
	margin: 20px;
	border-radius: 25px;
}
td.head {
	text-align: center;
	font-size: 20px;
}

td.title {
  	padding-left: 50px;
	text-align: left;
	font-size: 40px;
}

td.reg_date {
	text-align: right;
}

td.cnt {
	text-align: right;
}

td.img {
	text-align: center;
}

td.content {
	padding: 50px;
}

td.upfile {
	text-align: left;
}

td.comment_add {
	text-align: center;
}

td.modiNdel {
	text-align: right;
}

td#comment_regdate {
	text-align: left;
}

button.comment_addBTN {
	margin-left: 700px;
}

/* 댓글 내용 창 */
table tr td textarea {
	border: 1px solid #d7dce2;
	border-radius: 25px;
	padding: 20px;
}

#comment_add_txtarea {
	border: 1px solid #d7dce2;
	border-radius: 25px;
	padding: 20px;
}

.contentBR {
	margin: 20px 0px 20px 100px;
}
</style>
    <div id="main_wrap">
        <div>
            <h2 id="main_title">축구 용병 게시판 상세보기</h2>
        </div>
        <hr>
        <div id="commu_soc_guest_detail" >
            <table class="table">
                <tr>
                	<td class="head">[${dto.head }]</td>
                    <td class="title" colspan="3">${dto.title }</td>
                </tr>
                <tr>
                    <td class="user_id" colspan="2">${dto.user_id }</td>
                    <td class="reg_date">작성일 : <fmt:formatDate value="${dto.reg_date }" pattern="YYYY-MM-dd HH:mm"/></td>
                    <td class="cnt">조회 : ${dto.cnt }</td>
                </tr>
                
                <!-- 이미지 보여주는 줄 -->
                <tr>
                    <td class="img" colspan="4">
                    	<c:if test="${dto.img !=null }"> 
						<c:forTokens items ="${dto.img }" delims = "," var = "ee" varStatus="no">
							<img src="<c:url value="/uploadFile/commu/soc/guest/${ee}"/>" alt="" style="width: 300px; height: 300px;" />
						</c:forTokens>
						</c:if>
                    </td>
                </tr>
                
                <!-- 내용 -->
               	<tr>
                    <td class="content" colspan="4" id="contentBr"> ${dto.contentBr }</td>
                </tr>
                
                <!-- 첨부파일 보여주는 줄 -->
                <tr>     
                    <td>첨부파일</td>
                    <c:if test="${dto.upfile != null }">
                    <td class="upfile" colspan="3">
                    	<c:forTokens items ="${dto.upfile }" delims = "," var ="aa" varStatus="no">
							<%-- <img src="<c:url value="/uploadFile/board/${aa}"/>" alt="" /> --%>
							<a href="<c:url value="FileDown?fname=${aa}"/>"> ${dto.upfile }</a>
						</c:forTokens>
                    </td>
                    </c:if>
                </tr>
                <tr>
                    <td class="toList" colspan="2">
                        <a href="<c:url value="/commu_soc/guest/List?page=${nowPage }"/>"><button>목록으로</button></a>
                    </td>
                    <td class="modiNdel" colspan="2">
                    	<c:if test="${User.pid==dto.user_id }">
                    	<a href="<c:url value="/commu_soc/guest/ModifyForm?post_id=${dto.post_id }&page=${nowPage }"/>"><button>수정</button></a>
                    	<a href="<c:url value="/commu_soc/guest/DeleteForm?post_id=${dto.post_id }&page=${nowPage }"/>"><button>삭제</button></a>
                    	</c:if>
                    </td>
                </tr>

                <!-- 댓글 추가  -->
                <tr>
                    <td class="comment_add" colspan="4">
                        <textarea name="comment_input" id="comment_add_txtarea" cols="90" rows="5"
                            style="resize:none;"></textarea><br>
                        <button class="comment_addBTN" type="button" onclick="commentInsert()">댓글입력</button>
                        <input type="hidden" name="post_id" value="${dto.post_id }" />
                    </td>
                </tr>
            </table>
        </div>
        
        
        <!-- 댓글 리스트 -->
        <div id="comment_table">
            <table class="comment_table" style="margin:0px auto;" >
                <c:forEach var="comment_dto" items="${comment_dto }" varStatus="no">
                	
                    <tr>
                        <!-- 댓글 내용 -->
                        <td class="comment_list" colspan="3">
                            <textarea name="commentList" id="input_${comment_dto.comment_id}" cols="80" rows="3"
                                style="resize:none;" disabled>${comment_dto.content}</textarea>
                        </td>
                    </tr>
                    <tr >
                        <!-- 댓글 작성자 -->
                        <td align="right">
                            ${comment_dto.comment_writer } <input type="hidden" id="writer_${comment_dto.comment_id }"
                                value="${comment_dto.comment_writer }" />
                        </td>
                        <!-- 댓글 작성일 -->
                        <td align="right">
                            <fmt:formatDate value="${comment_dto.reg_date }" pattern="yyyy-MM-dd HH:mm" />
                            <input type="hidden" id="reg_date_${comment_dto.comment_id }"
                                value="${comment_dto.reg_date }" />
                        </td>                  
                        <!-- 댓글 수정 / 삭제 버튼 -->
                        <td align="right">
                        <c:if test="${User.pid == comment_dto.comment_writer }">
                        <button type="button" name="commentEdit" idx_data="${comment_dto.comment_id}"
                                onclick="commentModify(this)">수정</button>
                            <button type="button" idx_data="${comment_dto.comment_id}"
                                onclick="commentDelete(this)">삭제</button>
                                </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div id="post_bottom">

        </div>
    </div>
        


    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
        function commentInsert() {
            console.log("dklfjsldkf");
            var comment = document.getElementsByName("comment_input")[0].value;
            location.href = '/readytoplay/comment/Insert?post_id=${dto.post_id }&page=${nowPage }&user_id=${dto.user_id}&comment=' + comment;
        }

        function commentModify(me) {
            var com_area = $('#input_' + $(me).attr('idx_data'))

            if ($(me).html() == '수정') {
                com_area.attr('disabled', false)
                $(me).html('완료');
            } else {
                com_area.attr('disabled', true)
                $(me).html('수정');

                var commentData = new Object();
                commentData.comment_input = com_area.val();
                commentData.post_id = "${dto.post_id}";
                commentData.comment_id = $(me).attr('idx_data');
                commentData.writer = $('#writer_' + $(me).attr('idx_data')).val();
                commentData.reg_date = $('#reg_date_' + $(me).attr('idx_data')).val();

                $.ajax({
                    url: '/readytoplay/comment/Modify',
                    data: commentData,
                    type: 'POST',
                    success: function (result) {
                        alert("수정되었습니다.")
                        console.log(commentData);
                    },
                    error: function (e) {
                        console.log(e);
                    }
                })
            }
        }

        function commentDelete(me) {

            var commentData = new Object();
            commentData.comment_id = $(me).attr('idx_data');

            $.ajax({
                url: '/readytoplay/comment/Delete',
                data: commentData,
                type: 'POST',
                success: function (result) {
                    location.reload();
                    alert("삭제되었습니다.")
                },
                error: function (e) {
                    console.log(e);
                }
            })
        }
    </script>
