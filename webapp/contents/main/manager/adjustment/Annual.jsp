<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Calendar today = Calendar.getInstance();

	int first = today.get(Calendar.DAY_OF_WEEK);
	int year = today.get(Calendar.YEAR);
	int month = today.get(Calendar.MONTH)+1;
	int last = today.getActualMaximum(Calendar.DATE);
	
%>

<c:set var ="year" value = "<%=year %>"/>
<c:set var ="month" value = "<%=month%>"/>

<div class="container" >
    <main>
        <div class="row border-dark border-bottom" style="margin-bottom:20px">
        <h1>연간 정산</h1>
        </div>

        <div class="row">
          <div class="col text-center ">
            <a href="List"><button class="btn btn-primary">결제 현황</button></a>
            <a href="Annual?searchDate=2022"><button class="btn btn-primary">연간 정산</button></a>
<!--             <a href=""><button class="btn btn-primary">결제 현황</button></a> -->
<!--             <a href=""><button class="btn btn-primary">결제 현황</button></a> -->
<!--             <a href=""><button class="btn btn-primary">결제 현황</button></a> -->
          </div>
        </div>
        
        <div class="row" style="margin-top:30px">
        	<div class="col text-end fs-3 fw-bold">
        		<a href="Annual?searchDate=${searchDate-1 }"> <<<< </a>
        	</div>
        	
        	<div class="col-sm-3 text-center fs-3 fw-bold text-primary">
        		${searchDate }년
        	</div>
        	
        	<div class="col fs-3 fw-bold">
        		<c:if test="${searchDate != year }">
				<a href="Annual?${searchDate+1 }"> >>>> </a>
				</c:if>
        	</div>
        </div>
        
        <div class="row" style="margin-top:30px;">
        	<div class="container fs-5 	">
				<canvas id="myChart"></canvas>
  			</div>
        </div>
        
        <div class = "row">
        	<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${pageStart > 1 }">
						<li class="page-item disabled">
							<a class="page-link" href="<c:url value="List?page=${pageStart-1 }&dateSet=${dateSet }"/>">이전</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
						<c:choose>
							<c:when test="${nowPage == i }">
								<li class="page-item disabled"><a class="page-link"
									href="<c:url value="List?page=${i }&dateSet=${dateSet }"/>">${i }</a>
								</li>
							</c:when>
		
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="<c:url value="List?page=${i }&dateSet=${dateSet }"/>">${i }</a>
								</li>
							</c:otherwise>
						</c:choose>
		
					</c:forEach>
					<c:if test="${pageEnd<pageTotal }">
						<li class="page-item">
							<a class="page-link" href="<c:url value="List?page=${pageEnd+1 }&dateSet=${dateSet }"/>">다음</a>
						</li>
					</c:if>
				</ul>
			</nav>
        </div>
        
        <div class="row">
        	<div class="col text-end fs-3 fw-bold ">
	        	<p>합산 금액 : <fmt:formatNumber value="${tot }" />원</p>
        	</div>
        </div>
  </main>
</div>

 <!-- 부트스트랩 -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
  <!-- 차트 -->
  
<script>
// 	var arr = ${resultM}
var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ${keys},
        datasets: [{
          label: '연간 정산(만원)',
          data: ${values},
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(121, 59, 234, 0.2)',
            'rgba(35, 159, 64, 0.2)',
            'rgba(115, 186, 120, 0.2)',
            'rgba(95, 59, 100, 0.2)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(121, 59, 234, 1)',
            'rgba(35, 159, 64, 1)',
            'rgba(115, 186, 120, 1)',
            'rgba(95, 59, 100, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true,
              fontSize : 20
            }
          }],
			xAxes: [{
				ticks: {
					beginAtZero: true,
					fontSize : 20
				}
			}]
		},
        legend: {
			labels: {
				fontSize: 20
			}
		}
      }
    });
</script>
