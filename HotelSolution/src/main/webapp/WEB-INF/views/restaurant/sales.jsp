<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    
<title>Insert title here</title>
</head>
<style>
    body{
        background-color: rgba(217, 217, 217, 1);
        margin: 0px;
    }
    #mainboard{
        border-radius: 10px;
        background-color: white;
    }
    #title{
        font-size: 40px;
        font-weight: bold;
        display: flex;
        justify-content: center;
        padding: 10px;
    }
    #calendar{
      height: 90%;
      border: 3px solid black;
      border-radius: 10px;
    }
    #area{
        width: 100%;
        height: 80%;
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-top: 30px;
    }
    .month-area{
        width: 80%;
        height: 85%;
        
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 auto;
        
    }
    .name{
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .sales-area{
        width: 90%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .daySales{
        width: 60%;
    }
    .monthSales{
        width: 25%;
        height: 90%;
        border: 3px solid black;
        display: grid;
        grid-template-rows: 1fr 1fr 6fr;
        justify-items: center;
        border-radius: 10px;
    }
    .search-area input {
        border-radius: 5px;
        width: 60%;
    }
    .search-area{
        display: grid;
        grid-template-columns: 1.8fr 1.3fr 0.7fr;
    }
    #se-btn{
        width: 95%;
        height: 50%;
        border: 0;
        border-radius: 5px;
        background-color: rgba(59, 68, 75, 1);
        color: white;
    }
    .sales-con{
        border-top: 3px solid black;
        width: 80%;
        text-align: center;
    }
    .daySales a{
        color: black;
        text-decoration: none;
    }
    #se-btn:hover{
        cursor: pointer;
        background-color: rgb(86 93 98);
    }
    
</style>
<body>
   
    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
     
        <div id="mainboard">
     
           <div id="title">
                 매출관리 
             </div>
     
     
             <div id="area">
                 <div class="monthSales">
                    <div class="name">월 매출</div>
                    <div class="search-area">
                        <div id="year">
                            년도 : 
                            <input type="number" id="searchYear" name="year" min="1900" max="9999"  value="2023">
                        </div>
                        <div id="month">
                            월 : 
                            <input type="number" id="searchMonth" name="month" min="1" max="12" value="8">
                        </div>
                        <button id="se-btn" onclick="getMonthSales();">검색</button>
                    </div>
                    <div class="sales-area" id="getMonthSales">
                    </div>
                 </div>
     
                 <div id='calendar' class="daySales"></div>
     
                
             </div>
        
        </div>
     
     </div>


<script>

getMonthSales();

    function getMonthSales(){

        const year = document.querySelector("#searchYear").value;
        const month = document.querySelector("#searchMonth").value;

        $.ajax({
            type : "get" ,
            url : "${root}/restaurant/sales/getMonthSales" ,
            data : {
                year:year,
                month:month
            } ,
            dataType : "json" ,
            success : function(x){


                //받아온 정보로 div채우기
                const months = document.querySelector("#getMonthSales");
                let str = "";
            
                for(let i = 0; i < x.months.length; i++){
                    str +=		  "<div class='sales-con'>"
                                + "<div> "+x.years[i]+"년 "+ x.months[i]+"월</div>"
                                + "<div>총 매출 :</div>"
                                + "<div>"+ x.salesList[i].MONTH_SALES+" 원</div> "
                                + "</div>"
                }
                                    
                months.innerHTML = str;
            
            } ,
            error : function(x){
                alert("bad");
                console.log(x);
                } ,
            
        });




    }



    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth'
        ,start:'title'
        ,locale: 'ko'
        ,events: [
        
            <c:forEach items="${dayVo}" var="vo">
						{
						title: '${vo.totalPrice} 원',
						start: '${vo.day}',
						},
			</c:forEach>
            
            
        ]

        });
        calendar.render();
    });

</script>
    

</body>
</html>