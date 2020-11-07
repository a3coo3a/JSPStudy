package com.testweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.user.service.UserService;


@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dispatchServlet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dispatchServlet(request, response);
	}
	
	protected void dispatchServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		System.out.println(command);
		
		UserService service;
		
		if(command.equals("/user/login.user")) {	// 화면처리
			request.getRequestDispatcher("user_login.jsp").forward(request, response);
		}else if (command.equals("/user/join.user")) {	// 화면처리
			request.getRequestDispatcher("user_join.jsp").forward(request, response);
		}else if (command.equals("/user/mypage.user")) {		// 화면처리
			request.getRequestDispatcher("user_mypage.jsp").forward(request, response);
		}else if (command.equals("/user/mypageinfo.user")) {
			request.getRequestDispatcher("user_mypageinfo.jsp").forward(request, response);
		}else if (command.equals("")) {
			
		}else if (command.equals("")) {
			
		}else if (command.equals("")) {
			
		}else if (command.equals("")) {
			
		}else if (command.equals("")) {
			
		}else if (command.equals("")) {
			
		}
			
	}
}
