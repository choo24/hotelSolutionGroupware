<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        flex-direction: row;
        justify-content: space-around;
    }
    #list-area{
        width: 76%;
        height: 73%;
        margin: 0 auto;
        padding: 10px;
    }
    #ttt{
        width: 100%;
        text-align: center;
        border-collapse: collapse;
        
    }
    .bl{
        border: 1px solid black;
    }
    #hhh{
        background-color: rgba(59, 68, 75, 1);
        color: white;
        height: 50px;
    }
    tbody{
        height: 30px;
    }
    .te{
        width: 70%;
        border: 0px;
        text-align: end;
    }
    td>input[type="button"]{
        border: 0;
        color: white;
        border-radius: 5px;
    }
    .blue{
        background-color: blue;
    }
    .red{
        background-color: red;
    }
    #btn-area{
        width: 100%;
        display: flex;
        justify-content: center;
        height: 5%;
    }
    #plus{
       border: 0;
       background-color: rgba(59, 68, 75, 1);
       color: white;
       border-radius: 5px;
    }
    .mi{
        vertical-align: middle;
        text-align: center;
    }
    
</style>
<body>

	<div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
     
        <div id="mainboard">
     
           <div id="title">
                 메뉴 관리
             </div>
             <div id="search-area">
                 <div id="search">
                     <select name="" id="">
                         <option value="">메뉴 종류</option>
                         <option value="">메뉴 이름</option>
                     </select>
                     <input type="text">
                     <input type="submit" value="검색">
                 </div>
                 <div>* 메뉴 이름 , 가격 만 수정 가능합니다.</div>
             </div>
     
             <div id="list-area">
                 <table id="ttt">
                     <thead id="hhh">
                         <tr>
                             <th class="bl mi" style="width: 12.5%;">메뉴 번호</th>
                             <th class="bl mi" style="width: 25%;">메뉴 종류</th>
                             <th class="bl mi" style="width: 25%;">메뉴 이름</th>
                             <th class="bl mi" style="width: 12.5%;">가격</th>
                             <th class="bl mi" style="width: 12.5%;"></th>
                             <th class="bl mi" style="width: 12.5%;"></th>
                         </tr>
                     </thead>
                     <tbody>
                         <c:forEach begin="1" end="15">
                             <tr>
                                 <td class="bl">1</td>
                                 <td class="bl">파스타</td>
                                 <td class="bl"><input type="text" class="te" value="새우 크림 파스타"></td>
                                 <td class="bl"><input type="text" class="te" value="30000"> 원</td>
                                 <td class="bl">
                                     <input class="blue" type="button" value="수정">
                                 </td>
                                 <td class="bl">
                                     <input class="red" type="button" value="삭제">
                                 </td>
                             </tr>
                         </c:forEach>
                     </tbody>
                 </table>
             </div>
     
             <div id="btn-area">
                 <button id="plus">메뉴 추가</button>
             </div>
     
        
        </div>
     
     </div>

</body>
</html>