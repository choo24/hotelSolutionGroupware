<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #int-area{
        height: 75%;
        width: 80%;
        position: relative;
        top: 5%;
        margin: auto;
        border: 3px  solid rgba(59, 68, 75, 1) ;
        border-radius: 10px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .img{
        width: 70%;
        height: 40%;
        background-color: antiquewhite;
    }
    .line{
        display: inline-block;
        border-bottom: 3px solid rgba(59, 68, 75, 1);
        
    }
    #user-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    #user-area2{
        display: grid;
        grid-template-columns: 2fr 1fr 1fr;
    }
    #userdate-area{
        width: 70%;
    }
    .text-left{
        text-align: left;
    }
    .font-25{
        font-size: 25px;
        font-weight: bold;
        margin: 8px;
    }
    .font-20{
        font-size: 20px;
    }
    #ch{
        top: 90%;
        left: 70%;
        position: absolute;
    }
    button{
        position: relative;
        top: 10px;
        width: 120px;
        height: 35px;
        border-radius: 5px;
        color: white;
        border: 0px;
        background-color: rgba(59, 68, 75, 1) ;
        font-weight: bold;
    }
    #re{
        display: flex;
        flex-direction: row-reverse;
    }
    #re>a{
        position: relative;
        right: 20px;
    }
    #price{
        margin: 5px;
        font-weight: bold;
    }
    input{
        width: 120px;
    }
    .small-input{
        width: 50px;
    }
</style>
<body>

    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
    
        <div id="mainboard">
            <div id="title">
                객실 이용 / 예약
            </div>
            <div id="re">
                <a href="#" onclick="goBack();">돌아가기</a>
            </div>
    
            <div id="int-area">
                <div class="font-25">
                    방이름
                </div>
                <div class="font-20">
                    호수
                </div>
    
                <div class="img">
                    <img src="" alt="">
                </div>
                <div id="userdate-area">
                    <div class="line font-25">손님 정보</div>
                    <div id="user-area" class="text-left">
                        <div>
                            손님이름 : <input type="text">
                        </div>
                        <div>
                            국적 : <input type="text">
                        </div>
                    </div>
                    <div id="user-area2" class="text-left">
                        <div>
                            전화번호 : <input type="text">
                        </div>
                        <div>
                            성별 : <input class="small-input" type="text">
                        </div>
                        <div>
                            연령 : <input class="small-input" type="text"> 살
                        </div>
                    </div>
                    <div class="line font-25">이용날짜</div>
                    <div>
                        시작일 : <input type="date">
                    </div>
                    <div>
                        종료일 : <input type="date">
                    </div>
                    <div id="price">총 객실 금액 : 230000 원</div>
                </div>
                <div id="ch">
                    <button>예약하기</button>
                    <button>이용하기</button>
                </div>
    
            </div>
        </div>
    
    </div>
<script>
    function goBack() {
             window.history.back();
        }
</script>
</body>
</html>