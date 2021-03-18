package com.chat.webSocket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

// WebSocket�� ȣ��Ʈ �ּ� ����
@ServerEndpoint("/websocket")
public class WebSocket {
// WebSocket���� �������� �����ϸ� ��û�Ǵ� �Լ�
	@OnOpen
	public void handleOpen() {
// �ֿܼ� ���� �α׸� ����Ѵ�.
		System.out.println("client is now connected...");
	}

// WebSocket���� �޽����� ���� ��û�Ǵ� �Լ�
	@OnMessage
	public String handleMessage(String message) {
// �޽��� ������ �ֿܼ� ����Ѵ�.
		System.out.println("receive from client : " + message);
// ���� �޽����� �ۼ��Ѵ�.
		String replymessage = "echo " + message;
// ���� �޽����� �ֿܼ� ����Ѵ�.
		System.out.println("send to client : " + replymessage);
// ���� �޽����� �������� ������.
		return replymessage;
	}

// WebSocket�� �������� ������ ����� ��û�Ǵ� �Լ�
	@OnClose
	public void handleClose() {
// �ֿܼ� ���� ���� �α׸� ����Ѵ�.
		System.out.println("client is now disconnected...");
	}

// WebSocket�� ������ ���� ��� ������ �߻��ϸ� ��û�Ǵ� �Լ�.
	@OnError
	public void handleError(Throwable t) {
// �ֿܼ� ������ ǥ���Ѵ�.
		t.printStackTrace();
	}
}