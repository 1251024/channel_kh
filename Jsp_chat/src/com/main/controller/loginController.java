package com.main.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public loginController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		System.out.println(" [ " + command + " ] ");
		
		if (command.equals("login")) {
			response.sendRedirect("login.jsp");
		} else if (command.equals("loginres")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String dept = request.getParameter("dept");
			
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("dept", dept);
			
			dispatch(request, response, "main.jsp");
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
		
	}

}
