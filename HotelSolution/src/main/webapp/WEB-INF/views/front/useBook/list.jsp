<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    #search-area{
        display: flex;
        justify-content: flex-end;
    }
    #search{
        position: relative;
        right: 20px;
    }


    #list-area{
        width: 95%;
        height: 80%;
        margin: auto;

    }
    #list{
        width: 100%;
        height: 95%;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        align-items: center;
        justify-items: center;
    }

    #page-area{
        display: flex;
        justify-content: center
    }
    .att{
        height: 90%;
        width: 90%;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        border: 1px solid rgba(59, 68, 75, 1);
    }
    .img{
        height:50%;
        position: relative;
        top: 10px;
    }
    .name{
        font-size: 20px;
    }
    .ho{
        font-size: 15px;
    }
    .btn{
        height: 60px;
        display: flex;
        align-items: center;
    }
    button{
        height: 30px;
        width: 150px;
        border: 0px ;
        background-color:rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    

</style>
<body>

    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
    
        <div id="mainboard">
            <div id="title">
                이용/예약 가능한 객실
            </div>
    
            <div id="search-area">
                <div id="search">
                    <select name="" id="">
                        <option value="">방 호수</option>
                    </select>
                    
                    <input type="date">
                </div>
            </div>
    
            <div id="list-area">
                <div id="list">
                    <c:forEach items="${voList}" var="vo">
                        <div class="att" onclick="location.href='/fire/front/useBook/detail'">
                            <div class="img">
                                <img src="/fire/static/img/front/room001.jpg">
                            </div>
                            <div>
                                <div class="name">${vo.typeName}</div>
                                <div class="ho">${vo.roomNo}</div>
                                <div>금액 :  원</div>
                            </div>
                            <div class="btn">
                                <button>이용/예약하기</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="page-area">
                    이전 1 2 3 4 5 6 7 8 9 10 다음
                </div>
            </div>
        </div>
    
    </div>

</body>
</html>