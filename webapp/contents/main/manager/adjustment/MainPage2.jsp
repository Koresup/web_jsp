<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<h1>정산</h1>

<style>
    div#contents_wrap ul{
      list-style: none;
      padding: 0px;
    }

    div#contents_wrap  li{
      height: 40px;
      line-height: 40px;
      text-align: center;
    }

    div#contents_wrap{
      width: 100%;
       height: 500px;
    }

    div#adjust_wrap{
      width: 1400px;
      height: 100%;
      margin: 0px auto;
      background: #eee;
    }

    ul#adjust_list>li{
      float: left;
      margin-right: 20px;
    }

    div#coporation_wrap{
      width: 200px;
      height: auto;
      background: red;
    }

    div#month_wrap{
      width: 100px;
      height: auto;
      background: blue;
      display:none;
      position: relative;
      left: -50px;
    }

    div#goods_wrap{
      width: 150px;
      height: auto;
      background: yellow;
      display:none;
      position: relative;
      left: -50px;
    }

    div#payment_wrap{
      width: 700px;
      height: auto;
      background: green;
      display:none;
      left: -50px;
      
    }

    li.selected{
      background: #333;
    }
  </style>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>

  <script>
    document.addEventListener('DOMContentLoaded', ()=>{
      const copMenu = document.querySelectorAll('#corporation_list>li')
      const monthMenu = document.querySelectorAll('#month_list>li')
      const goodsMenu = document.querySelectorAll('#goods_list>li')
      
      const monthDiv = document.querySelector('#month_wrap')
      const goodsDiv = document.querySelector('#goods_wrap')
      const paymentDiv = document.querySelector('#payment_wrap')
      
      let arr = ${manager}
      let goodsArr = ['gym_basketball','gym_soccer','lesson_basketball', 'lesson_basketball'];
		
      let selectedMenu = null;
      let selectedMonth = null;
      let selectedGoods = null;
    
      let managerName = null;
      let month = null;
      let goods = null;
      
      
      
      const payment = document.getElementById('#payment_list');
      
      var list = new Array();
      
      var list2 = new Array();
      list = ${jacksonData}
//       <c:forEach var ="dto" items="${mainData}">
//       	list.push(${dto});
//       	</c:forEach>
      	
//       	alert(list[0]['amount'])
      	
      
      	
      	
      for(const item of copMenu){
        item.addEventListener('click', viewMonth)
      }

      for(const item of monthMenu){
        item.addEventListener('click', viewGoods)
      }

      for(const item of goodsMenu){
        item.addEventListener('click', viewPayment)
      }
  

//       function listUpdate(){
//     	  for(var i = 0; i< ${mainData.size()}; i++){
//     		  if(managerName == '${mainData[0].manager_id}'){
    			  
//     		  }
//     	  }
//       }
      
      
      function viewMonth(){
        let clickIndex = getIndex(this);
        managerName = Object.keys(arr)[clickIndex]
//         alert(managerName)
        copActivate(clickIndex)
       	alert(dateFormat(new Date(list[0]['reg_date'])))
      }

      function viewGoods(){
        let clickIndex = getIndex(this);
        monthActivate(clickIndex)
        month = clickIndex+1;
//         alert(month)
      }

      function viewPayment(){
    	for(index in list){
    		if(list[index]['manager_id']==managerName){
    			addList(list[index])
    		}
    	}  
    	  
        let clickIndex = getIndex(this);
        paymentActivate(clickIndex)
        goods = goodsArr[clickIndex]
//         alert(goods)
      }

      function getIndex(menu){
        let checkMenu = menu;
        let selectedIndex = 0;

        while((checkMenu=checkMenu.previousElementSibling) != null){
          selectedIndex++;
        }

        return selectedIndex;
      }

      
      function dateFormat(date) {
          let month = date.getMonth() + 1;
          let day = date.getDate();
          let hour = date.getHours();
          let minute = date.getMinutes();
          let second = date.getSeconds();

          month = month >= 10 ? month : '0' + month;
          day = day >= 10 ? day : '0' + day;
          hour = hour >= 10 ? hour : '0' + hour;
          minute = minute >= 10 ? minute : '0' + minute;
          second = second >= 10 ? second : '0' + second;

          return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
 	 }
      
      function addList(str){
    	  
    	  
    	  const dateTime = dateFormat(new Date(str['reg_date']));
    	  
    	  const addValue = str['buyer_name']+"/"+str['sname']+"/"+str['sname']+"/"+str['resDate']+"/"+dateTime+"/"+str['amount'];
    	  
    	  const li = document.createElement("li");
    	  li.setAttribute('id',addValue);
    	  
    	  const textNode = document.createTextNode(addValue);
    	  li.appendChild(textNode);
    	  
    	  document.getElementById('payment_list').appendChild(li);
      }
      
      function copActivate(index){
        if(selectedMenu != null && selectedMenu != copMenu[index]){
          selectedMenu.classList.remove('selected');
          if(selectedMonth!= null){
            selectedMonth.classList.remove('selected');
          }
          if(selectedGoods!= null){
            selectedGoods.classList.remove('selected');
          }
          gsap.set(monthDiv, {display:'none',left:-50, opacity:0})
          gsap.set(goodsDiv, {display:'none',left:-50, opacity:0})
          gsap.set(paymentDiv, {display:'none',left:-50, opacity:0})
        }

        if(selectedMenu != copMenu[index]){
          selectedMenu = copMenu[index];
          selectedMenu.classList.add('selected');
          gsap.set(monthDiv, {display:'block'})
          gsap.to(monthDiv,{left:0, opacity:1, duration:0.3, ease:'power1.out'})
        }
      }

      function monthActivate(index){
        if(selectedMonth != null && selectedMonth != monthMenu[index]){
          selectedMonth.classList.remove('selected');
          if(selectedGoods!= null){
            selectedGoods.classList.remove('selected');
          }
          gsap.set(goodsDiv, {display:'none',left:-50, opacity:0})
          gsap.set(paymentDiv, {display:'none',left:-50, opacity:0})
        }

        if(selectedMonth != monthMenu[index]){
          selectedMonth = monthMenu[index];
          selectedMonth.classList.add('selected');
          gsap.set(goodsDiv, {display:'block'})
          gsap.to(goodsDiv,{left:0, opacity:1, duration:0.3, ease:'power1.out'})
        }
      }

      function paymentActivate(index){
        if(selectedGoods != null && selectedGoods != goodsMenu[index]){
          selectedGoods.classList.remove('selected');
          gsap.set(paymentDiv, {display:'none',left:-50, opacity:0})
        }

        if(selectedGoods != goodsMenu[index]){
          selectedGoods = goodsMenu[index];
          selectedGoods.classList.add('selected');
          gsap.set(paymentDiv, {display:'block'})
          gsap.to(paymentDiv,{left:0, opacity:1, duration:0.3, ease:'power1.out'})
        }
      }

      
    })


  </script>

</head>
<body>
  <h1>정산페이지</h1>
<div id= "contents_wrap">
  <div id= "adjust_wrap">
  <ul id="adjust_list">
    <li>
      <div id="coporation_wrap">
        <ul id ="corporation_list">
       		 <c:forEach var="i" items="${managerMap }">
				<li>${i.key} / ${i.value }원</li>
			</c:forEach>
				
        </ul>
      </div>
    </li>

    <li>
      <div id="month_wrap">
        <ul id ="month_list">
          <li>1월</li>
          <li>2월</li>
          <li>3월</li>
          <li>4월</li>
          <li>5월</li>
          <li>6월</li>
          <li>7월</li>
          <li>8월</li>
          <li>9월</li>
          <li>10월</li>
          <li>11월</li>
          <li>12월</li>
        </ul>
      </div>
    </li>

    <li>
      <div id="goods_wrap">
        <ul id ="goods_list">
          <li>농구대관</li>
          <li>축구대관</li>
          <li>농구레슨</li>
          <li>축구레슨</li>
        </ul>
      </div>
    </li>
    <li>
      <div id="payment_wrap">
        <ul id ="payment_list">
          <li>회원 / 아카데미 / 사용일 / 결제일 / 금액</li>
          	
          
<%-- 			<c:forEach var="dto" items="${mainData }" varStatus="no"> --%>
<%-- 			<c:if test="${dto.manager_id == manager[1] }"> --%>
<%-- 					<li>${dto.buyer_name } / ${dto.sname } /${dto.resDate } /${dto.reg_date } /${dto.amount }</li> --%>
<%-- 					</c:if> --%>
<%-- 			</c:forEach> --%>
			
        </ul>
      </div>
    </li>
    <li></li>
  </ul>  
    

    

    

    
  </div>
</div>
