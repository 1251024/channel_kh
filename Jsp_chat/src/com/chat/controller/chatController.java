package com.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chat.dao.ChatDao;
import com.chat.dto.ChatDto;

@WebServlet("/chat.do")
public class chatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public chatController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		ChatDao dao = new ChatDao();
		
		if (command.equals("insert")) {
			
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			
			ChatDto dto = new ChatDto();
			dto.setName(name);
			dto.setContent(content);
			
			int res = dao.insert(dto);
			
			if (res > 0) {
				System.out.println("DB입력성공");
			} else {
				System.out.println("DB입력실패");
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
