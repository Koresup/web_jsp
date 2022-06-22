<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var = "type" value="gym"/>

<div class="container">
    <main>
        <div class="row border-dark border-bottom" style="margin-bottom:20px">
        <h1>내가 쓴 글</h1>
        </div>
        <div class="row">
            <jsp:include page="../sideMenu.jsp"/>

            <div class="col">
            	<div class="row">
            		<div class="col text-center" >
						<a href="<c:url value="List?board=bas_board"/>"><button type="button" class="btn btn-outline-secondary">농구 자유게시판</button></a>
						<a href="<c:url value="List?board=bas_compet"/>"><button type="button" class="btn btn-outline-secondary">농구 대회정보</button></a>
						<a href="<c:url value="List?board=bas_guest"/>"><button type="button" class="btn btn-outline-secondary">농구 용병게시판</button></a>
						<a href="<c:url value="List?board=soc_board"/>"><button type="button" class="btn btn-outline-secondary">축구 자유게시판</button></a>
						<a href="<c:url value="List?board=soc_compet"/>"><button type="button" class="btn btn-outline-secondary">축구 대회정보</button></a>
						<a href="<c:url value="List?board=soc_guest"/>"><button type="button" class="btn btn-outline-secondary">축구 용병게시판</button></a>
						<a href="<c:url value="List?board=market"/>"><button type="button" class="btn btn-outline-secondary">마켓</button></a>
            		</div>
            		
            	</div>
            	
            
                <table class="table table-hover">
                    <thead>
                      <tr>
	                    <th class="col text-center"  style="width:80px">번호</th>
	                    <th class="col text-center" style="width:150px" >게시판</th>
	                    <th class="col text-center" >제목</th>
	                    <th class="col text-center" style="width:120px" >작성일</th>
	                    <th class="col text-center" style="width:100px" >조회수</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dto" items="${mainData }" varStatus="no">
                <tr>
               	 	<td  class = "col text-center">
                  		${ start + no.index+1}
                 	 </td>
                  
                  <td class="col text-center" >
					<c:choose>
						<c:when test = "${fn:contains(dto.post_id, 'bas_board')}">
							<c:set var = "type" value="../../commu_bas/board/Detail?post_id=${dto.post_id }"/>
							농구 자유게시판
						</c:when>
						<c:when test = "${fn:contains(dto.post_id, 'bas_compet')}">
							<c:set var = "type" value="../../commu_bas/compet/Detail?post_id=${dto.post_id }"/>
							농구 대회정보
						</c:when>
						<c:when test = "${fn:contains(dto.post_id, 'bas_guest')}">
							<c:set var = "type" value="../../commu_bas/guest/Detail?post_id=${dto.post_id }"/>
							농구 용병
						</c:when>
						<c:when test = "${fn:contains(dto.post_id, 'soc_board')}">
							<c:set var = "type" value="../../commu_soc/board/Detail?post_id=${dto.post_id }"/>
							축구 자유게시판
						</c:when>
						<c:when test = "${fn:contains(dto.post_id, 'soc_compet')}">
							<c:set var = "type" value="../../commu_soc/compet/Detail?post_id=${dto.post_id }"/>
							축구 대회정보
						</c:when>
						<c:when test = "${fn:contains(dto.post_id, 'soc_guest')}">
							<c:set var = "type" value="../../commu_soc/guest/Detail?post_id=${dto.post_id }"/>
							축구 용병
						</c:when>
						<c:otherwise>
						<c:set var = "type" value="../../market/PostDetail_Reg?post_id=${dto.post_id }"/>
							마켓
						</c:otherwise>
					</c:choose>
                  </td>
                  
                  <td  class = "col">
                    <a href="<c:url value="${type }"/>">${dto.title }</a>
                  </td>
                  
                  <td class="col text-center">
                  	<fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd"/>
                  </td>

                  <td class = "col text-center"> 
                  	${dto.cnt }
                  </td>
                  
                </tr>
                </c:forEach>
              </tbody>
                   <tfoot>
                   <tr><td class="paging" colspan="7">
                       <nav aria-label="Page navigation example">
                           <ul class="pagination justify-content-center">
                             <li class="page-item">
                            <c:if test="${pageStart > 1 }">
                            	 <a class="page-link"  href="<c:url value="List?page=${pageStart-1 }&board=${param.board }"/>">이전</a>
							</c:if>
                          	 </li>
						<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1"> 
							<c:choose>
								<c:when test="${nowPage == i }">
										<li class="page-item disabled">
											<a class="page-link" href="<c:url value="List?page=${i }&board=${param.board }"/>">${i }</a>
										</li>
								</c:when>		
								
								<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="<c:url value="List?page=${i }&board=${param.board }"/>">${i }</a>
								</li>
								</c:otherwise>		
							</c:choose>
						</c:forEach>
                             	<li class="page-item">
	                   			<c:if test="${pageEnd<pageTotal }">
	                                <a class="page-link" href="<c:url value="List?page=${pageEnd+1 }&board=${param.board }"/>">다음</a>
								</c:if>
							</li>
                           </ul>
                         </nav>
                   </td></tr>
               </tfoot>
                  </table>    
            </div>
      </div>
  </main>
</div>


<!-- <table border=""> -->
<!-- 	<tr> -->
<!-- 		<th>게시판 종류</th> -->
<!-- 		<th>제목</th> -->
<!-- 		<th>작성일</th> -->
<!-- 		<th>조회수</th> -->
<!-- 	</tr> -->
	
<%-- 	<c:forEach var="dto" items="${mainData }" varStatus="no"> --%>
		
<!-- 	<tr> -->
<!-- 		<td> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test = "${fn:contains(dto.post_id, 'bas_board')}"> --%>
<%-- 					<c:set var = "type" value="../../commu_bas/board/Detail?post_id=${dto.post_id }"/> --%>
<!-- 					농구 자유게시판 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test = "${fn:contains(dto.post_id, 'bas_compet')}"> --%>
<%-- 					<c:set var = "type" value="../../commu_bas/compet/Detail?post_id=${dto.post_id }"/> --%>
<!-- 					농구 대회정보 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test = "${fn:contains(dto.post_id, 'bas_guest')}"> --%>
<%-- 					<c:set var = "type" value="../../commu_bas/guest/Detail?post_id=${dto.post_id }"/> --%>
<!-- 					농구 용병 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test = "${fn:contains(dto.post_id, 'soc_board')}"> --%>
<%-- 					<c:set var = "type" value="../../commu_soc/board/Detail?post_id=${dto.post_id }"/> --%>
<!-- 					축구 자유게시판 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test = "${fn:contains(dto.post_id, 'soc_compet')}"> --%>
<%-- 					<c:set var = "type" value="../../commu_soc/compet/Detail?post_id=${dto.post_id }"/> --%>
<!-- 					축구 대회정보 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test = "${fn:contains(dto.post_id, 'soc_guest')}"> --%>
<%-- 					<c:set var = "type" value="../../commu_soc/guest/Detail?post_id=${dto.post_id }"/> --%>
<!-- 					축구 용병 -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 				<c:set var = "type" value="../../market/PostDetail_Reg?post_id=${dto.post_id }"/> --%>
<!-- 					마켓 -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 		</td> -->
		
<%-- 		<td><a href="<c:url value="${type }"/>">${dto.title }</a></td> --%>
		
<!-- 		<td> -->
<%-- 		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/> --%>
<!-- 		</td> -->
<%-- 		<td>${dto.cnt }</td> --%>
<!-- 	</tr> -->
	
<%-- 	</c:forEach> --%>
<!-- 	<tr> -->
<!-- 		<td colspan="5" align="center"> -->
<%-- 			<c:if test="${pageStart > 1 }"> --%>
<%-- 				<a href="<c:url value="List?page=${pageStart-1 }"/>">[이전]</a> --%>
<%-- 			</c:if> --%>
<%-- 			<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${nowPage == i }"> --%>
<%-- 							[${i }] --%>
<%-- 					</c:when>		 --%>
					
<%-- 					<c:otherwise> --%>
<%-- 					<a href="<c:url value="List?page=${i }"/>">${i }</a> --%>
<%-- 					</c:otherwise>		 --%>
<%-- 				</c:choose> --%>
				
				
				
<%-- 			</c:forEach> --%>
			
<%-- 			<c:if test="${pageEnd<pageTotal }"> --%>
<%-- 			<a href="<c:url value="List?page=${pageEnd+1 }"/>">[다음]</a> --%>
<%-- 			</c:if> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->