package com.testweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.service.UserDeleteServiceImpl;
import com.testweb.user.service.UserJoinServiceImpl;
import com.testweb.user.service.UserLoginServiceImpl;
import com.testweb.user.service.UserMypageContentServiceImpl;
import com.testweb.user.service.UserService;
import com.testweb.user.service.UserUpdateServiceImpl;


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
			
			service = new UserMypageContentServiceImpl();
			int result = service.execute(request, response);
			if(result == 1) {
				request.getRequestDispatcher("user_mypage.jsp").forward(request, response);
			}
			
			
		}else if (command.equals("/user/mypageinfo.user")) {
			request.getRequestDispatcher("user_mypageinfo.jsp").forward(request, response);
		}else if (command.equals("/user/joinForm.user")) {		// 회원가입 처리
			service = new UserJoinServiceImpl();
			int result = service.execute(request, response);  // 중복회원 존재시 1, 아니면 0
			// result 중복회원 > 1, sqlJoin실패시 > 2, 성공시 0
			if(result == 2) {
				System.out.println("sql삽입 실패");
			}else if(result == 1) {
				request.setAttribute("msg", "이미 존재하는 아이디입니다. 다시 가입해주세요");
				request.getRequestDispatcher("user_join.jsp").forward(request, response);
			}else if(result == 0) {
				response.sendRedirect("login.user");
			}
			
		}else if (command.equals("/user/loginForm.user")) {
			service = new UserLoginServiceImpl();
			int result = service.execute(request, response);	// 실패 1, 성공 0
			
			if(result == 1) {
				request.setAttribute("msg", "로그인에 실패 하였습니다. 아이디와 비밀번호를 확인하세요");
				request.getRequestDispatcher("user_login.jsp").forward(request, response);
			}else {
				response.sendRedirect("mypage.user");
			}
		
		}else if(command.equals("/user/delete.user")) {		// 회원 탈퇴 처리
			service = new UserDeleteServiceImpl();
			int result = service.execute(request, response); // 성공 1, 실패 0
			
			if(result == 1) {
				response.sendRedirect(request.getContextPath());
			}else if(result == 0) {
				request.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해주세요");
				request.getRequestDispatcher("user_mypage.jsp").forward(request, response);
			}
		}else if(command.equals("/user/modify.user")) {  // 회원 정보 수정
			service = new UserUpdateServiceImpl();
			int result = service.execute(request, response);
			if(result == 1) {
				response.sendRedirect("mypage.user");
			}else {
				request.setAttribute("msg", "수정에 실패 하였습니다.");
				request.getRequestDispatcher("user_mypageinfo.jsp").forward(request, response);
			}
		}else if(command.equals("/user/logout.user")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath());
			
		}
			
	}
}
