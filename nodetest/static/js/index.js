const socket = io()

/* 접속 되었을 때 실행 */
socket.on('connect', function() {	
	/* 이름을 입력받고 */
	const name = prompt('반갑습니다!','')
	
	/* 이름을 빈칸인 경우 */
	if(!name) {
		name = '익명'
	}
	
	/* 서버에 새로운 유저가 왔다고 알림 */
	socket.emit('newUser', name)
})

socket.on('update', function(data) {
	console.log(`${data.name}: ${data.message}`)
})


/* 전송 함수 */
function send() {
	// 입력되어 있는 데이터 가져오기
	const message = document.getElementById('test').value
	
	// 가져왔으니 데이터를 빈칸으로 변경
	
	document.getElementById('test').value = ''
	
	// 서버로 message 이벤트 전달 + 데이터와 함께
	socket.emit('message', {type: 'message', message: message})
	
}