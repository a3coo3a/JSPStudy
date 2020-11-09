package com.testweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.service.BbsGetListServiceImpl;
import com.testweb.bbs.service.BbsService;
import com.testweb.bbs.service.MainBbsGetListServiceImpl;


@WebServlet("/index.main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MainController() {
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
		
		BbsService service = new MainBbsGetListServiceImpl();
		int result = service.execute(request, response);
		
		if(result == 1) {	
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}
