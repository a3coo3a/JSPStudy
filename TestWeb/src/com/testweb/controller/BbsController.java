package com.testweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.service.BbsContentServiceImpl;
import com.testweb.bbs.service.BbsDeleteServiceImpl;
import com.testweb.bbs.service.BbsGetListServiceImpl;
import com.testweb.bbs.service.BbsService;
import com.testweb.bbs.service.BbsUpdateServiceImpl;
import com.testweb.bbs.service.BbsWriteServiceImpl;


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
		
		if(command.equals("/bbs/bbs.bbs")) {				// 화면처리, 리스트 출력
			service = new BbsGetListServiceImpl();
			int result = service.execute(request, response);
			
			if(result == 1) { // 성공
				request.getRequestDispatcher("bbs.jsp").forward(request, response);
				
			}else {
				response.sendRedirect(request.getContextPath());
			}
			
		}else if (command.equals("/bbs/write.bbs")) {		// 화면처리
		
			request.getRequestDispatcher("bbs_write.jsp").forward(request, response);
		
		}else if (command.equals("/bbs/content.bbs")) {		// 화면처리, 내용 출력
			service = new BbsContentServiceImpl();
			int result = service.execute(request, response);
			
			if(result == 1) {
				request.getRequestDispatcher("bbs_content.jsp").forward(request, response);
			}else {
				response.sendRedirect("bbs.bbs");
			}
				
		}else if (command.equals("/bbs/modify.bbs")) {		// 화면처리
			service = new BbsContentServiceImpl();
			int result = service.execute(request, response);
			
			if(result == 1) {
				request.getRequestDispatcher("bbs_modify.jsp").forward(request, response);
			}else {
				response.sendRedirect("content.bbs");
			}
		}else if (command.equals("/bbs/writeForm.bbs")) {
			service = new BbsWriteServiceImpl();
			int result = service.execute(request, response);	
			
			if(result == 1) {
				response.sendRedirect("bbs.bbs");
			}else {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter out = response.getWriter();  
				out.println("<script>");
				out.println("alert('저장되지 않았습니다.');");
				out.println("location.href='write.bbs';");				
				out.println("</script>");
			}
			
		}else if (command.equals("/bbs/updateForm.bbs")) {	// 글수정 처리
			service = new BbsUpdateServiceImpl();
			int result = service.execute(request, response);
			
			if(result == 1) {
				request.getRequestDispatcher("bbs_content.jsp").forward(request, response);
			}else {
				response.sendRedirect("modify.bbs");
			}
			
			
		}else if(command.equals("/bbs/delete.bbs")) {
			service = new BbsDeleteServiceImpl();
			int result = service.execute(request, response);
			
			if(result == 1) {
				response.sendRedirect("bbs.bbs");
			}
		}
		
		
		
	}

}
