<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CHANNEL</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="image/main/channel_icon2.png">
    <link href="./css/main.css" rel="stylesheet">

    <script src="../assets/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
	
	<div class="main_container">
		<div class="head_container">해더</div>
		<div class="nav_container">
			<div class="nav_menu_container">메뉴
				<div class="nav_menu_box">활동</div>
				<div class="nav_menu_box">메세지</div>
				<div class="nav_menu_box">채널</div>
				<div class="nav_menu_box">일정</div>
				<div class="nav_menu_box">통화</div>
				<div class="nav_menu_box">더보기</div>
			</div>
			<div class="nav_list_container">
				<div class="channel_select_container">채널선택창</div>
				<div class="direct_massage_container">다이렉트메세지</div>
			</div>
			
		</div>
		<div class="action_container">
			<div class="chat_container">
				<div class="chat_state_area">채팅창<br>채팅영역</div>
				<div class="chat_text_area">텍스트에어리어</div>
			</div>
			<div class="list_container">TODOLIST</div>
		</div>		
	</div>
	
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>		
</body>
</html>