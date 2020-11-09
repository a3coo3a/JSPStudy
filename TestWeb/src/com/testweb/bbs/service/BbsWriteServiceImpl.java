package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.bbs.model.BbsDAO;
import com.testweb.user.model.UserVO;

public class BbsWriteServiceImpl implements BbsService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		
		
		UserVO user = (UserVO)session.getAttribute("user");
		
		String id = user.getId();
		
		BbsDAO dao = BbsDAO.getInstance();
	
		int result = dao.write(writer, title, content, id);
	
		return result;
	}

}
