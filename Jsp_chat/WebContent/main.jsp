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
<% 
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");

%>

<%
	//String id = "";
	//if (session.getAttribute("id") != null) {
	//	id = (String) session.getAttribute("id");
	//}

	//String nick = "";
	//if (session.getAttribute("nick") != null) {
	//	nick = (String) session.getAttribute("nick");
	//} else {
	//	nick = "NICK NULL";
	//}
%>

<body>
	
	<div class="col-xs-12" style="height: 100%;">
		<div class="col-xs-12" style="height: 10%;">
			<span><%=id %>(<%=name %>)님이 접속하였습니다.</span>
		</div>
		<div class="col-xs-4" style="height: 90%;">
			<div class="col-xs-4" style="height: 100%;">
				<div id="box" class="col-xs-8" >활동</div>
				<div id="box" class="col-xs-8" >메세지</div>
				<div id="box" class="col-xs-8" >채널</div>
				<div id="box" class="col-xs-8" >일정</div>
				<div id="box" class="col-xs-8" >통화</div>
				<div id="box" class="col-xs-8" >더보기</div>
			</div>
			<div class="col-xs-8" style="height: 100%;">
				<div class="col-xs-12" style="height: 50%;" >채널선택창</div>
				<div class="col-xs-12" style="height: 50%;" >다이렉트메세지</div>
			</div>
			
		</div>
		<div class="col-xs-8" style="height: 90%;">
			<div class="col-xs-6" style="height: 100%;">
				<div class="col-xs-12" style="background: white; height: 50%;">
					<div id="chatarea" class="col-xs-12" style="background: white; height: 80%; overflow: auto">
					</div>
					<div id="texteditor" class="col-xs-12" style="background: white; height: 20%; border-top: 1px solid black;">
						<input id="inputMessage" type="text" onkeydown="if(event.keyCode==13){send();}" class="col-xs-10" style="background: gray; height: 100%; border: 1px solid black;">
						<input type="submit" value="전송" onclick="send();" class="col-xs-2" 
						style="background: gray; height: 100%; border: 1px solid black; text-align: center;"
						>
					</div>
				</div>
				<div class="col-xs-12" style="height: 50%;">텍스트에어리어</div>
			</div>
			<div class="col-xs-6" style="height: 100%;">TODOLIST</div>
		</div>		
	</div>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript">
  //웹소켓 설정
	var webSocket = new WebSocket('ws://localhost:8787/Jsp_chat/websocket');
	//var webSocket = new WebSocket('ws://localhost:8080/프로젝트명/broadcasting');
	var inputMessage = document.getElementById('inputMessage');
	//같은 이가 여러번 보낼때 이름 판별할 변수
	var re_send = "";

	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	//	OnClose는 웹 소켓이 끊겼을 때 동작하는 함수.
	function onClose(event){
		var div=document.createElement('div');
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%= name%> is DisConnected\n");
	}

	//	OnMessage는 클라이언트에서 서버 측으로 메시지를 보내면 호출되는 함수.
	function onMessage(event) {

		//클라이언트에서 날아온 메시지를 |\| 단위로 분리한다
		var message = event.data.split("|\|");
		
			//금방 보낸 이를 re_send에 저장하고,
			//금방 보낸 이가 다시 보낼경우 보낸이 출력 없도록 함.
			if(message[0] != re_send){
				//"chatarea"에 붙이기
				var who = document.createElement('div');

				who.style["padding"]="3px";
				who.style["margin-left"]="3px";
				who.style["float"]="right";
				who.style["display"]="inline-block";
				who.style["color"]="black";
				who.style["border"]="1px solid white";

				who.innerHTML = message[0];
				document.getElementById('chatarea').appendChild(who);
				
				var clear=document.createElement('div');
				clear.style["clear"]="both";
				document.getElementById('chatarea').appendChild(clear);

				re_send = message[0];
			}
		
			//div는 받은 메시지 출력할 공간.
			var div=document.createElement('div');
		
			div.style["width"]="auto";
			div.style["word-wrap"]="break-word";
			div.style["float"]="right";
			div.style["display"]="inline-block";
			div.style["background-color"]="lightgray";
			div.style["border-radius"]="3px";
			div.style["padding"]="3px";
			div.style["margin-left"]="3px";
			div.style["color"]="black";
			div.style["border"]="1px solid white";

			div.innerHTML = message[1];
			document.getElementById('chatarea').appendChild(div);
		
		//clear div 추가. 줄바꿈용.		
		var clear=document.createElement('div');
		clear.style["clear"]="both";
		document.getElementById('chatarea').appendChild(clear);
		
		//div 스크롤 아래로.
		chatarea.scrollTop = chatarea.scrollHeight;
		
	}

	//	OnOpen은 서버 측에서 클라이언트와 웹 소켓 연결이 되었을 때 호출되는 함수.
	function onOpen(event) {
		
		//접속했을 때, 내 영역에 보이는 글.
		var div=document.createElement('div');
		
		div.style["color"]="black";
		div.style["border"]="1px solid white";
		div.style["float"]="left";
		
		div.innerHTML = "<%=name %>님 메세지를 입력해주세요.";
		document.getElementById('chatarea').appendChild(div);
		
		var clear=document.createElement('div');
		clear.style["clear"]="both";
		document.getElementById('chatarea').appendChild(clear);
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%=name%>님이 접속하였습니다.|\|메세지를 보내주세요.");
	}

	//	OnError는 웹 소켓이 에러가 나면 발생을 하는 함수.
	function onError(event) {
		alert("chat_server connecting error " + event.data);
	}
	
	// send 함수를 통해서 웹소켓으로 메시지를 보낸다.
	function send() {

		//inputMessage가 있을때만 전송가능
		if(inputMessage.value!=""){
			
			//	서버에 보낼때 날아가는 값.
			webSocket.send("<%=name%>|\|" + inputMessage.value);
			
			// 채팅화면 div에 붙일 내용
			var div=document.createElement('div');
			
			div.style["width"]="auto";
			div.style["word-wrap"]="break-word";
			div.style["float"]="left";
			div.style["display"]="inline-block";
			div.style["background-color"]="#ffea00";
			div.style["padding"]="3px";
			div.style["border-radius"]="3px";
			div.style["margin-right"]="3px";
			div.style["color"]="black";
			div.style["border"]="1px solid white";

			//div에 innerHTML로 문자 넣기
			div.innerHTML = inputMessage.value;
			document.getElementById('chatarea').appendChild(div);

			//clear div 추가
			var clear = document.createElement('div');
			clear.style["clear"] = "both";
			document.getElementById('chatarea').appendChild(clear);
			
			//	?
			//inputMessage.value = "";

			//	inputMessage의 value값을 지운다.
			inputMessage.value = '';

			//	textarea의 스크롤을 맨 밑으로 내린다.
			chatarea.scrollTop = chatarea.scrollHeight;
			
			//	금방 보낸 사람을 임시 저장한다.
			re_send = "<%=name%>";
		}//inputMessage가 있을때만 전송가능 끝.
		
	}
    </script>		
</body>
</html>