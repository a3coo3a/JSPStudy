package com.testweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.service.BbsService;


@WebServlet("*.bbs")
public class BbsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BbsController() {
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
		
		BbsService service;
		
		if(command.equals("/bbs/bbs.bbs")) {				// 화면처리
			request.getRequestDispatcher("bbs.jsp").forward(request, response);
		}else if (command.equals("/bbs/write.bbs")) {		// 화면처리
			request.getRequestDispatcher("bbs_write.jsp").forward(request, response);
		}else if (command.equals("/bbs/content.bbs")) {		// 화면처리
			request.getRequestDispatcher("bbs_content.jsp").forward(request, response);
		}else if (command.equals("/bbs/modify.bbs")) {		// 화면처리
			request.getRequestDispatcher("bbs_modify.jsp").forward(request, response);
		}else if (command.equals("")) {
			
			
			
		}else if (command.equals("")) {
			
		}else if (command.equals("")) {
			
		}else if (command.equals("")) {
			
		}else if (command.equals("")) {
			
		}
		
		
		
		
	}

}
