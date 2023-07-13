<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        margin: 0px;
    }
    
    a{
        text-decoration:none;
        color: black;
        transition-duration: 1s;
    }
    
    a:hover{
    	color : #586b79;
    }

    #wrap{
    	width:100vw;
    	height:100vh;
    	display:flex;
    	justify-content:center;
    	align-items:center;
    }
    
    #box{
        width: 700px;
        height: 500px;
        border: 1px solid #3B444B;
        border-radius: 10px;
        margin: 0 auto;
    }
    
    #logo{
        display: flex;
        justify-content: center;
        margin-top : 20px;
    }

    .join-area{
         display: grid;
        grid-template-columns: repeat(2,1fr);
        grid-template-rows: 1fr 0.5fr;
        font-size:20px;
        place-items: center;
        margin-top:15px;
    }
    
    label {
    	display:inline-block;
    	width:100px;
    }
	
	.join-area > input{
		border: none;
        outline: none;
        font-size:20px;
        padding: 3px;
	}

    /* @media(max-width: 768px){
        .login-area{
            flex-direction: column-reverse;
        }
    } */
    

    #join-btn{
    	margin: auto;
    	display : flex;
    	justify-content:center;
    	margin-top:5px;
    }
    
   
    #join-btn > input{
    	width:200px;
    	height:30px;
    	font-size:20px;
    	color:white;
    	background-color:black;
    	border : 1px solid black;
    	border-radius: 5px;
    	margin-top : 5px;
    	font-weight:700;
    	transition-duration: 0.5s;
    } 
    
     #join-btn > input:hover{
        cursor: pointer;
       background-color:#586b79;

    }
    
    #imgFile{
    	display: none;
    }
    
    .profile{
    	color:gray;
    }
    
    .profile:hover{
        cursor: pointer;
        color : #586b79;
    }
    
    select{
    	border :1px solid lightgray;
    	border-radius:10px;
    	width:100px;
    }
	
</style>
</head>
<body>

	<div id="wrap">

    <form action="">
        <div id="box">
            <div id="logo">
                <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
            </div>
            
            <div class="join-area">
                 <label for="name">NAME</label>
                <input type="text" placeholder="이름을 입력하세요." >
            </div>
            
            <div class="join-area">
                 <label for="name">ID</label> 
                <input type="text" placeholder="휴대폰번호로 가입하기" maxlength="11">
            </div>
           
            <div class="join-area">
                 <label for="name">PWD</label> 
                <input type="password" placeholder="8~16자 대문자+특수문자 사용" maxlength="16">
            </div>
           
            <div class="join-area">
                 <label for="name">E-MAIL</label> 
                <input type="email" placeholder="이메일을 입력하세요">
            </div>
           

                <div class="join-area">
                    <label for="name">PROFILE</label> 
                    <label class="profile" for="imgFile">
                       프로필사진
                    </label>
                   <input type="file" id="imgFile">
               </div>
   
               <div class="join-area">
                    <label for="name">POSITION</label> 
                    <select name="position" class="select">
                       <option disabled selected value="">직급</option>
                       <option value="employee">사원</option>
                       <option value="supervisor">슈퍼바이저</option>
                       <option value="leader">팀장</option>
                       <option value="manager">호텔지배인</option>
                    </select>
                   
               </div>
               
               <div class="join-area">
                    <label for="name">DEPARTMENT</label> 
                    <select name="department" class="select">
                       <option disabled selected value="">부서</option>
                       <option value="hr">인사팀</option>
                       <option value="food">식음팀</option>
                       <option value="business">경영지원팀</option>
                       <option value="finace">구매/재무팀</option>
                       <option value="front">프론트/시설관리팀</option>
                    </select>
               </div>


				<div id="join-btn"><input type="submit" value="가입하기"></div>
				
               
        </div>

     </form>

    </div>

</body>
</html>