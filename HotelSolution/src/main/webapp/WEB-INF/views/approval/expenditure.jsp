<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"><head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /* 모달 */
.modal {
    display: none; /* 기본적으로 모달을 숨깁니다 */
    position: fixed; /* 고정 위치에 표시됩니다 */
    z-index: 1; /* 최상위에 표시됩니다 */
    left: 0;
    top: 0;
    width: 100%; /* 전체 너비 */
    height: 100%; /* 전체 높이 */
    overflow: auto; /* 필요한 경우 스크롤 활성화 */
    background-color: rgba(0,0,0,0.4); /* 불투명한 검은 배경 */
}

.modal-content {
    background-color: white;
    margin: 15% auto; /* 상단으로부터 15% 내려오며 중앙 정렬됩니다 */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* 화면 크기에 따라 조절 가능 */
}

#box{
        width: 1000px;
        height: 800px;
        border: 1px solid #3B444B;
        border-radius: 10px;
        margin: 0 auto;
    }
    
    #logo{
        display: flex;
        justify-content: center;
        margin-top : 30px;
    }
    
    .lineText{
    	margin-left:25px;
    }
    
    #search-area{
    	display:flex;
    	flex-direction: column;
    	width:270px;
    }

	#search-area > div:first-child{
		font-size:20px;
		font-weight:bold;
		margin-top:10px;
		color: #86C8DB;
	}
	
	#search-bar{
		margin-top:15px;
		margin-left:25px;
	}
	
	#employee{
		height:550px;
		width: 350px;
		border:1px solid lightgray;
		margin-top:20px;
	}
	
	.team{
		height:30px;
		background-color:#e9ecef;
		border:1px solid #e9ecef;
		box-sizing:border-box;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	
	.teamName{
		padding:7px 0px;
		margin-left :7px;
		font-size:14px;
	}
	
	.position{
		font-size:13px;
		font-weight:bold;
	}

	.iii{
		font-size: 14px;
	}

	.position{
		position: relative;
		left: 17px;
	}

	.bi-plus-circle{
		font-size: 13px;
	}
	
	#employeeList{
		width:200px;
		height:200px;
		border: 1px solid gray;
	}
	
	.teamName-con {
   		display: flex;
    	align-items: center;
	}

	.x {
	    height: 20px; 
	    margin-left: 10px; 
	    font-size:13px;
	    font-weight:bold;
	}
	
	.x-container{
		position:relative;
		left: 30px;
		width:200px;
		height:300px;
		border : 1px solid black;
		overflow: auto;
	}

	.team-container{
		position: relative;
	}

	#btn-area{
		position: relative;
		left: 400px;
		bottom: 350px;
		display: grid;
		grid-template-rows: 1fr 1fr;
		grid-gap: 30px;
		width: 70px;
		height: 100px;

	}

	#btn-area button{
		border: 1px solid black;
		background-color: white;
		cursor: pointer;
	}

	.search-btn{
		display:flex;
	}
	
	.search-btn > button{
		width:50px;
		background-color:white;
		border:1px solid black;
		box-sizing:border-box;
		margin-left:10px;
		cursor: pointer;
	}
	
	#select-approval{
		position:relative;
		left:550px;
		bottom:454px;
	}
	
	.td2{
		width:50px;
		text-align:center;
	}

	#select-approval > table{
		border-collapse: collapse;
	}
	
	#select-approval > table > tbody > tr > td{
		height:50px;
	}
	
	#select-approval > table > tbody > tr > td:first-child{
		width:30px;
		text-align:center;
		color: lightgray;
	}

	#select-approval > table > tbody > tr > td:last-child{

		width: 300px;

	}
	
	#reference-div{
	
		margin-top:150px;
	}
	
	.reference-list{
		border : 1px solid gray;
		width:390px;
		height:68px;
		margin-top:5px;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		place-items: center;
	}

	.submit-btn{
		position: relative;
		right: 150px;
		top: 40px;
		display:flex;
		justify-content:space-evenly;
		width:200px;
	}

	.submit-btn > button{
		width: 50px;
		height: 30px;
		border: 1px solid black;
		background-color: white;
		cursor: pointer;
	}

    #approval-table{
        border: 1px solid gray;
    }
	
	#approval-table tr > td{
		text-align: center;
        border: 1px solid gray;
        padding-top :15px;
	}

    #openModalBtn{
        position: relative;
        right: 40px;
        top: 21px;
        color : #86C8DB;
        border: 1px solid #86C8DB;
        font-weight: bold;
        cursor: pointer;
        width: 120px;
        height: 30px;
        display: flex;
        place-items: center;
        justify-content: center;
    }



/* 모달 끝-------------- */
    body{
        margin: 0;
        background-color: lightgray;
    }
    #approval{
        border: 1px solid white;
        width: 1200px;
        height: 800px;
        background-color:white;
        margin:auto;
        border-radius:10px;
    }
    
    .myDate{
    	color:#949494;
    	border:none;
        outline: none;
    }
    
    .title , .date{
    	color:#949494;
    	font-size:18px;
    }
    
    #head-right > table{
    	border: 1px solid lightgray;
    	text-align:center;
    	border-collapse:collapse;
    	table-layout:fixed;
    	width:100;
    	position:relative;
    	top:20px;
    	right:40px;
    }
    
   #head-right > table tr{
    	border:1px solid lightgray;
    	width:20%;
    	padding:10px;
    	height:30px;
    }
    
    #head-right > table td{
    	letter-spacing:2px;
    	border:1px solid lightgray;
    	padding:7px;
    	width:1%;
    	font-size:12px;
    	font-weight:bold;
    	vertical-align:middle;
    }
    
    #head{
    	display:grid;
    	grid-template-columns:1.5fr 1fr;
    }
    
    #head-left{
    	position:relative;
    	top:40px;
    	left:30px;
    }
    
    #document{
    	position:relative;
    	top:40px;
    }
    
    #head-left > h1{
    	font-size:25px;
    	padding:0px 0px 10px;
    	margin-top:10px;
    }
    
    #head-left > input{
    	font-size:18px;
    }

    /* #document > table > tbody > tr:last-child{

        height: 100px;

    } */
    
    .first-table , .second-table{
    	border-collapse: collapse;
        border: 1px solid lightgray;
        border-top: 1px solid black;
    }
    
    .first-table > thead > tr > td{
    	width:90px;
    	height:50px;
    	text-align:center;
    	border: 1px solid lightgray;
    	vertical-align:middle;
    }

    .first-table > thead > tr > td > input{
    	
    	width: 500px;
    
    }
    
     .first-table > tbody > tr > td{
    	width:125px;
    	height:50px;
    	text-align:center;
    	border:1px solid lightgray;
    	vertical-align:middle;
    }
    
	.input{
		border:none;
		outline:none;
		text-align:center;
	}    

    .end-input{
    	border:none;
    	outline:none;
    	font-size:16px;
    	font-weight:bold;
    }
    
    #last-td{
    	font-weight:bold;
    }
    
    .end-div{
    	display:flex;
    	justify-content:flex-end;
    	margin-top:15px;
    }
    
    .submitBtn{
    	display:flex;
    	align-items:center;
    	justify-content:center;
    }
    
    input[type=submit]{
        background-color: #d9d9d9ed;
        border: 1px solid lightgray;
        border-radius:5px;
    }

	.first-table{
		margin:auto;
		margin-top:20px;
		width:800px;
	}
	
	.second-table{
		margin:auto;
		margin-top:20px;
		width:800px;
		height:450px;
	}
	
	.second-table > thead > tr > td{
    	width:90px;
    	text-align:center;
    	border: 1px solid lightgray;
    	vertical-align:middle;
    }
    
    .second-table > tbody > tr > td{
    	width:125px;
    	text-align:center;
    	border:1px solid lightgray;
    	vertical-align:middle;
    }
    
    .second-table > thead > tr > th{
    	text-align:center;
    	height:30px;
    	vertical-align:middle;
    }
	
	.second-table > thead > tr > td:first-child{
		width:250px;
	}
	
	.second-table > thead > tr > td:last-child{
		width:190px;
	}
	
	tbody input[name="product"]{
		width:250px;
		box-sizing:border-box;
	}

    tbody input[name="price"]{
		width:150px;
		box-sizing:border-box;
	}
	
	tbody input[name="totalPrice"]{
		width:150px;
		box-sizing:border-box;
	}
	
	tbody input[name="note"]{
		width:190px;
		box-sizing:border-box;
	}
	
	.second-table input{
		border:none;
		outline:none;
		text-align:center;
	}
	
	.second-table > tbody > tr > th{
		text-align:center;
		vertical-align:middle;
	}
	
	.last-td-content{
		margin-top:20px;
		display:flex;
		justify-content:center;
	}
	
	.setup-btn{
		background-color:white;
		border : 1px solid white;
        cursor: pointer;
	}

    .setup-btn:hover{
        background-color: lightgray;
    }

	#approval-line{
        position: relative;
        right: 40px;
        top: 21px;
        color : #86C8DB;
        border: 1px solid #86C8DB;
        font-weight: bold;
        cursor: pointer;
        width: 120px;
        height: 30px;
        display: flex;
        place-items: center;
        justify-content: center;
    }
    
</style>
</head>
<body>


    <div id="myModal" class="modal">
        <div class="modal-content" style="width: 1100px; border-radius: 30px;">
            <div id="box">
                <div id="logo">
                    <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
                </div>
                <div id="search-area">
                    <div class="lineText">결재선 설정</div>
                    <div id="search-bar">
                        <div class="search-btn">
                            <input type="text" name="search" placeholder="이름 검색">
                            <button>검색</button>
                        </div>
                        <div id="employee">
                            <div class="team-container">
                                <div class="team">조직도</div>
                                <c:forEach items="${teamList}" var="teamList">
                                    <div class="teamName-con">
                                        <div onclick="openDiv('${teamList.teamNo}');" class="teamName"><i id="iconHr${teamList.teamNo}" class="bi bi-plus-circle-fill iii"></i>${teamList.teamName}</div>
                                        
                                            <div class="x">
                                            </div>
    
    
                                    </div>
                                    <div class="teams" id="teams" style="display:none">
                                        <div class="position">
                                            <c:forEach items="${positionList}" var="pList">
                                                <div onclick="openList('${teamList.teamNo}' , '${pList.no}' ,'${teamList.teamName}' , '${pList.name}');"><i class="bi bi-plus-circle"></i>${pList.name }</div>
                                            </c:forEach>
                                        </div>
                                    </div>
    
                                </c:forEach>
                                
                            </div>
                        </div>
                            <div id="btn-area">
                                <button type="button" onclick="handleTable();">결재&nbsp;&nbsp;></button>
                                <button type="button" onclick="handleReference();">참조&nbsp;&nbsp;></button>
                                        
                            </div>
                        </div>
                </div>
                    <div id="select-approval">
                                    <table border="1" id="approval-table">
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td class="td2" style="width: 50px;">결재</td>
                                                <td class="employee-name"></td>
                                            </tr>
                
                                            
                                            
                                            <tr>
                                                <td>2</td>
                                                <td class="td2" style="width: 50px;">결재</td>
                                                <c:forEach items="${list}" var = "member">
                                                    <c:if test="${member.approvalPower eq '2' }">
                                                        <td>${member.name}(${member.teamName} ${member.positionName})</td>
                                                    </c:if>
                                                </c:forEach>
                                            </tr>
                
                                        </tbody>
                                    </table>
    
                                
    
                                
                        
        
                        <div id="reference-div">
                            <div class="reference">참조</div>
                            <div class="reference-list">
                               
                            </div>
                        </div>
                    
                    <div class="submit-btn">
                        <button type="submit">확인</button>
                        <button onclick="closeModal();">닫기</button>
                    </div>
                </div>
    
    
            </div>
        </div>
    </div>




    <!-- ----------------------------- -->
    
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/common/main.jsp" %>
        
        <div id="mainboard">
            
            <input type="hidden" name="teamNo" value="${loginMember.teamNo}">
        <div id="approval">
        	<form id="expenditure-form" action="${root}/approval/expenditure" method="post">
        
        	
        		<div id ="head">
        		
        			<div id="head-left">
						<div class="title">기안문서</div>
						<h1>호텔 솔루션 지출결의서</h1>        
						<span class="date">요청일자</span> 
					 	 : <input type="date" class="myDate">
        			</div>
					
					<div id="head-right">
					
						<div id="openModalBtn">결재선 만들기</div>

						<table>
                            <thead>
                                <tr>
                                    <td>기안자</td>
                                    <td>팀장</td>
                                    <td>인사팀 팀장</td>
                                </tr>
                            </thead>
                                
                               <tbody>
	                                <tr>
	                                	<td>${loginMember.name}</td>
	                                	<td></td>
	                                	<td></td>
	                                </tr>
	                                
	                                <tr>
	                                	<td style="font-weight:bold;" colspan="3">참조자</td>
	                                </tr>
	                                
	                                <tr>
	                                	<td></td>
	                                	<td></td>
	                                	<td></td>
	                                </tr>
                                </tbody>
                        </table>
						
					</div>
        		</div>
        		
        		<div id="document">
        			<table class="first-table" border="1">
                        <thead>
                            <tr>
                                <td>제목</td>
                                <td colspan="5" class="document-title"><input class="input" type="text" name="title"></td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td class="info">소속</td>
                                <td><input class="input" type="text" name="team" value="${loginMember.teamName}"></td>
                                <td class="info">직책</td>
                                <td><input class="input" type="text" name="position" value="${loginMember.positionName}"></td>
                                <td class="info">성명</td>
                                <td><input class="input" type="text" name="user_name" value="${loginMember.name}"></td>
                            </tr>

                        </tbody>
                    </table>
                    
                    <table border="1" class="second-table">
                        <thead>
                            <tr>
                                <th>품명</th>
                                <th>수량</th>
                                <th>금액</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                <select name="item" class="item-select">
                                    <option value=""></option>
                                	<c:forEach items="${itemList}" var="item">
                                		<c:if test="${item.teamNo == loginMember.teamNo}">
		                                    <option value="${item.itemNo}" data-price="${item.price}">${item.name}</option>
                                		</c:if>
                                	</c:forEach>
                                </select>
                                </td>
                                <td><input type="text" name="count" class="count-input"></td>
                                <td><input type="text" name="price" class="price-input"></td>
                            </tr>
                           
                            <tr>
                                <td>
                                <select name="item" class="item-select">
                                    <option value=""></option>
                                	<c:forEach items="${itemList}" var="item">
                                		<c:if test="${item.teamNo == loginMember.teamNo}">
		                                    <option value="${item.itemNo}" data-price="${item.price}">${item.name}</option>
                                		</c:if>
                                	</c:forEach>
                                </select>
                                </td>
                                <td><input type="text" name="count" class="count-input"></td>
                                <td><input type="text" name="price" class="price-input"></td>
                            </tr>
                           
                            <tr>
                                <td><select name="item" class="item-select">
                                    <option value=""></option>
                                	<c:forEach items="${itemList}" var="item">
                                		<c:if test="${item.teamNo == loginMember.teamNo}">
		                                    <option value="${item.itemNo}" data-price="${item.price}">${item.name}</option>
                                		</c:if>
                                	</c:forEach>
                                </select></td>
                                <td><input type="text" name="count" class="count-input"></td>
                                <td><input type="text" name="price" class="price-input"></td>
                           
                            </tr>
                           
                            <tr>
                                <td><select name="item" class="item-select">
                                    <option value=""></option>
                                	<c:forEach items="${itemList}" var="item">
                                		<c:if test="${item.teamNo == loginMember.teamNo}">
		                                    <option value="${item.itemNo}" data-price="${item.price}">${item.name}</option>
                                		</c:if>
                                	</c:forEach>
                                </select></td>
                                <td><input type="text" name="count" class="count-input"></td>
                                <td><input type="text" name="price" class="price-input"></td>
                            </tr>

                            <tr>
                                <td><select name="item" class="item-select">
                                    <option value=""></option>
                                	<c:forEach items="${itemList}" var="item">
                                		<c:if test="${item.teamNo == loginMember.teamNo}">
		                                    <option value="${item.itemNo}" data-price="${item.price}">${item.name}</option>
                                		</c:if>
                                	</c:forEach>
                                </select></td>
                                <td><input type="text" name="count" class="count-input"></td>
                                <td><input type="text" name="price" class="price-input"></td>
                            </tr>

                            <tr>
                                <td><select name="item" class="item-select">
                                    <option value=""></option>
                                	<c:forEach items="${itemList}" var="item">
                                		<c:if test="${item.teamNo == loginMember.teamNo}">
		                                    <option value="${item.itemNo}" data-price="${item.price}">${item.name}</option>
                                		</c:if>
                                	</c:forEach>
                                </select></td>
                               <td><input type="text" name="count" class="count-input"></td>
                                <td><input type="text" name="price" class="price-input"></td>
                            </tr>

                            <tr>
                                <td><select name="item" class="item-select">
                                    <option value=""></option>
                                	<c:forEach items="${itemList}" var="item">
                                		<c:if test="${item.teamNo == loginMember.teamNo}">
		                                    <option value="${item.itemNo}" data-price="${item.price}">${item.name}</option>
                                		</c:if>
                                	</c:forEach>
                                </select></td>
                                <td><input type="text" name="count" class="count-input"></td>
                                <td><input type="text" name="price" class="price-input"></td>
                            </tr>

                            <tr>
                                <td><select name="item" class="item-select">
                                    <option value=""></option>
                                	<c:forEach items="${itemList}" var="item">
                                		<c:if test="${item.teamNo == loginMember.teamNo}">
		                                    <option value="${item.itemNo}" data-price="${item.price}">${item.name}</option>
                                		</c:if>
                                	</c:forEach>
                                </select></td>
                                <td><input type="text" name="count" class="count-input"></td>
                                <td><input type="text" name="price" class="price-input"></td>
                            </tr>

                            <tr>
                                <th>합계</th>
                                <td>X</td>
                                <td><input type="text" name="totalPrice" class="total-price-input"></td>
                            </tr>
                            
                            <tr style="height:180px;">
                           		<td colspan="3">
                           			<div id="last-td">
	                           			<div class="last-td-content">지출결의서를 제출합니다.</div>
	                           			<div class="end-div">작성인 : <input style="width: 100px;" class="end-input" type="text" name="name" value="${loginMember.name}"></div>
						                <div class="submitBtn">
							                <input type="submit" value="제출하기">
						                </div>
                           			</div>
                           		</td>
                           	</tr>
                        </tbody>
                    </table>
                    
        		</div>
        		<input type="hidden" name="typeNo" value="${documentType.documentTypeNo}">


        	</form>
        		
	    </div>


   </div>
		

    </div>
    
	<script>
	
    //웹페이지 로드될때 결재문서 insert
	$(document).ready(function() {
        $.ajax({
        url : '${root}/approval/insertApprovalDocument',
        method : 'post',
        data : {
            typeNo : "${documentType.documentTypeNo}",
            userNo : "${loginMember.no}"
        },
        success : (data)=>{
            console.log(data);
            if(data == 'success'){
                alert('성공');
            }
        },
        error : (e)=>{
            console.log(e);
            alert('fail');
        }
    });
});

	 //가격 매기기
    document.addEventListener('DOMContentLoaded', () => {
    const itemSelects = document.querySelectorAll('.item-select');
    const countInputs = document.querySelectorAll('.count-input');
    const priceInputs = document.querySelectorAll('.price-input');
    const totalPriceInput = document.querySelector('.total-price-input');

    itemSelects.forEach((itemSelect, index) => {
        itemSelect.addEventListener('change', () => {
            calculateRowAmount(index);
            calculateTotalPrice();
            console.log(itemSelect , index);
        });

        countInputs[index].addEventListener('input', () => {
            calculateRowAmount(index);
            calculateTotalPrice();
        });
    });

    function calculateRowAmount(index) {
        const selectedPrice = parseFloat(itemSelects[index].options[itemSelects[index].selectedIndex].getAttribute('data-price'));
        const selectedCount = parseFloat(countInputs[index].value);
        
        if (!isNaN(selectedPrice) && !isNaN(selectedCount)) {
            const price = selectedCount * selectedPrice;
            priceInputs[index].value = price;
        } else {
            priceInputs[index].value = '';
        }
    }

    function calculateTotalPrice() {
        let total = 0;
        priceInputs.forEach((priceInput) => {
            const amount = parseFloat(priceInput.value);
            if (!isNaN(amount)) {
                total += amount;
            }
        });
        const formattedTotal = total.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' });
        totalPriceInput.value = total;
    }

    function formatCurrency(amount) {
        return amount.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW', minimumFractionDigits: 0, maximumFractionDigits: 0 });
    }
});

    // 모달 요소를 가져옵니다.
    const modal = document.getElementById('myModal');

    // 모달을 열기 위한 버튼을 가져옵니다.
    const openModalBtn = document.getElementById('openModalBtn');

    // 모달 내용을 담는 <span> 요소를 가져옵니다.
    const modalContent = modal.querySelector('.modal-content');

    // 모달을 엽니다.
    function openModal() {
        modal.style.display = 'block';
    }

    // 모달을 닫습니다.
    function closeModal() {
        modal.style.display = 'none';
    }

    // 버튼을 클릭하면 모달을 엽니다.
    openModalBtn.addEventListener('click', openModal);

    // // 모달 내용을 클릭하면 모달을 닫습니다.
    // modalContent.addEventListener('click', closeModal);

    // 사용자가 모달 외부 어디를 클릭하면 모달을 닫습니다.
    window.addEventListener('click', event => {
        if (event.target === modal) {
            closeModal();
        }
    });

    // //결재선 정하기
	// function approvalLineWindow(){
	// 	const no = '${documentType.documentTypeNo}'
	// 	const width = 1200;
	// 	const height = 1200;
	// 	const left = (screen.width/2) - (width/2);
	// 	const top = 0;
    //     const newWindow = window.open('${root}/approval/approvalLine?documentTypeNo='+no, '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', noopener');
    // }


    //직책 보여주기
		function openDiv(index) {
			const teams = document.querySelectorAll('.teams')
			const teamDiv = teams[index];
			const allIcon = document.querySelectorAll('.iii');
			const icon = allIcon[index]; 
			console.log(teamDiv);
			console.log(icon);
			if(teamDiv.style.display == 'none' || teamDiv.style.display == ''){
				teamDiv.style.display = 'block';
				icon.classList.remove("bi-plus-circle-fill");
				icon.classList.add('bi-dash-circle-fill');
			}else{
				teamDiv.style.display = 'none';
				icon.classList.remove('bi-dash-circle-fill');
				icon.classList.add("bi-plus-circle-fill");
			}
			
		}
		
		//사원 정보 가져오기
		function openList(teamNo , positionNo ,teamName , positionName) {
			let x = document.querySelector('.x');
			let str = "";
			$.ajax({
				url : '${root}/approval/getEmployee',
				method : 'get',
				data : {
					teamNo : teamNo,
					positionNo : positionNo,
					teamName : teamName,
					positionName : positionName,
				},
				dataType: 'json',
				contentType: 'application/json; charset=utf-8',  
				success : (data)=>{
						str += '<div class="x-container">'
					for(let i=0; i<data.length; i++){
						str += '<input type="checkbox" class="employee-checkbox" name="checkbox-" value=" ' + data[i].name + ' ' + '('+data[i].teamName+' '+data[i].positionName+')'+'">'+
						data[i].name +" " +"("+data[i].teamName + " "+data[i].positionName+")" + "<br>";
						str += '<input type="hidden" name="positionNo" value="'+data[i].positionNo+'">'
					}
						str += "</div>"
					x.innerHTML = str;
				},
				
				error :  (e)=>{
					alert('통신실패');
					console.log(e);
				}
			})
			
		}
		
		function handleTable() {
			
			const employee = document.querySelector('input[name=checkbox-]:checked');
			const td = document.querySelector('table .employee-name');
			const position = document.querySelector('input[name=positionNo]').value;
			const em =employee.value;
			td.innerHTML = em;


		}
			
		

		function handleReference() {
			const employee = document.querySelector('input[name=checkbox-]:checked');
			const reference = document.querySelector('.reference-list');
			console.log(employee);
			console.log(reference[0]);
			console.log(reference[1]);
			console.log(reference[2]);
			const em = employee.value;
			
			reference.innerHTML += '<div>'+employee.value+'</div>';

		};

	
	</script>
	

</body>
</html>