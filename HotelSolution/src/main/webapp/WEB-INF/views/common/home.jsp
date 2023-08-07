<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>로그인 후 메인 화면 </title>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/main.jsp" %>
		<link rel="stylesheet" href="${root}/resources/css/common/home.css">
		<script defer src="${root}/resources/js/common/header.js"></script>
		<div id="mainboard">
			<div class="main-board-container">
				<div class="commute-box">
					<div class="quick-mail-title">
						<h1>통근관리</h1>
					</div>
				</div>
				<div class="calendar-box">
					<div class="quick-mail-title">
						<h1>나의일정</h1>
					</div>
				</div>
				<div class="mail">
					<div class="quick-mail-title">
						<h1>메일함</h1>
					</div>

					<!-- Category buttons -->
					<div class="btn-group" role="group" aria-label="Mail categories">
						<button type="button" class="btn btn-secondary" onclick="showReceivedMails()">받은 메일함</button>
						<button type="button" class="btn btn-secondary" onclick="showUnreadMails()">안읽은 메일함</button>
						<button type="button" class="btn btn-secondary" onclick="showSentMails()">보낸 메일함</button>
					</div>

					<!-- Received Mails -->
					<div class="quick-mail-view-container received-mails">
						<h1>좋아요</h1>
					</div>

					<!-- Unread Mails -->
					<div class="quick-mail-view-container unread-mails" style="display: none;">
						<h2>부트스트랩</h2>
					</div>

					<!-- Sent Mails -->
					<div class="quick-mail-view-container sent-mails" style="display: none;">
						<h2>보낸메일함</h2>
					</div>
				</div>
				<div class="board-box">
					<div class="quick-mail-title">
						<h1>게시판</h1>
						<div id="board-list"></div>
					</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>

<script>
	$(document).ready(function () {
		function getTopBoardList() {
			$.ajax({
				url: "${root}/board/getList",
				type: "GET",
				dataType: 'json',
				success: function (data) {
					console.log(data);
					$('#board-list').empty();
					$.each(data, function (index, item) {
						let hiddenNo = '<span class="hidden-no" style="display:none;">' + item.no + '</span>';
						let title = '<span class="title">' + item.title + '</span>';
						let content = '<span class="content ml-3">' + item.content + '</span>';

						let postWrapper = '<div class="single-post-wrapper border rounded p-3 mb-4 d-flex" data-url="' + "YOUR_ROOT_URL" + '/board/detail?no=' + item.no + '">' + hiddenNo + title + content + '</div>';
						$('#board-list').append(postWrapper);
					});
					$('#board-list > div').css({ 'width' : '550px','height': '25px', 'line-height': '15px', 'overflow': 'hidden' ,'font-size' : '15px' });
				},
				error: function (jqXHR, textStatus, errorThrown) {
					console.log(textStatus, errorThrown);
				}
			});
		}

		getTopBoardList();
		setInterval(getTopBoardList, 300000);
	});
	// 5 minutes = 300000 milliseconds
</script>