package com.chat.dto;

import java.util.Date;

public class ChatDto {

	private int chatseq;
	private String name;
	private String content;
	private Date regdate;
	
	public ChatDto() {
		
	}
	
	public ChatDto(String name, String content, Date regdate, int chatseq) {
		this.chatseq = chatseq;
		this.name = name;
		this.content = content;
		this.regdate = regdate;
	}

	public int getChatseq() {
		return chatseq;
	}

	public void setChatseq(int chatseq) {
		this.chatseq = chatseq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
}
