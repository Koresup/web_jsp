<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="main_wrap">
        <div class="row border-dark border-bottom" style="margin-bottom:20px">
			<h1>Q&A</h1>
		</div>
        <div class="row ">
	        <div class="col text-end">
	        	<a href="<c:url value="home"/>"><button type="button" class="btn btn-outline-secondary">홈으로</button></a>
	        	<a href="<c:url value="InsertForm?page=${nowPage }"/>"><button type="button" class="btn btn-outline-secondary">새글쓰기</button></a>
	        </div>
        </div>
        
        <div id="feedback">
            <table class="table table-hover">
                <thead>
                  <tr>
                    <th class="col text-center"  style="width:100px">번호</th>
			          <th class="col text-center" style="width:100px" >분류</th>
			          <th class="col" >제목</th>
			          <th class="col text-center" style="width:200px" >작성일</th>
			          <th class="col text-center" style="width:150px" >상태</th>
                  </tr>
                </thead>
                
                <tbody>
                	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
						<tr onclick="location.href='<c:url value="Detail?id=${dto.id }&page=${nowPage }"/>'">
							<td class="col text-center" >${ start + no.index+1}</td>
							<td class = "col text-center">${dto.filter }</td>
							<td class = "title">
								${dto.title }
							</td>
							<td  class = "col text-center">
								<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/>
							</td>
							<td  class = "col text-center">
								<c:choose>
									<c:when test="${dto.answer != null }"> 답변완료</c:when>
									<c:otherwise>
										미답변
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:forEach>
                </tbody>
                <tfoot>
                    <tr><td class="paging" colspan="5">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                              <li class="page-item">
	                            <c:if test="${pageStart > 1 }">
	                            	 <a class="page-link"  href="<c:url value="List?page=${pageStart-1 }"/>">이전</a>
								</c:if>
                           	 </li>
							<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1"> 
								<c:choose>
									<c:when test="${nowPage == i }">
											<li class="page-item disabled">
												<a class="page-link" href="<c:url value="List?page=${i }"/>">${i }</a>
											</li>
									</c:when>		
									
									<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="List?page=${i }"/>">${i }</a>
									</li>
									</c:otherwise>		
								</c:choose>
							</c:forEach>
                              	<li class="page-item">
		                   			<c:if test="${pageEnd<pageTotal }">
		                                <a class="page-link" href="<c:url value="List?page=${pageEnd+1 }"/>">다음</a>
									</c:if>
								</li>
                            </ul>
                          </nav>
                    </td></tr>
                </tfoot>
              </table>    
        </div>
    </div>
    
    
