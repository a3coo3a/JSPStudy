package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.bbs.model.BbsDAO;
import com.testweb.user.model.UserVO;

public class BbsDeleteServiceImpl implements BbsService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
		
		BbsDAO dao = BbsDAO.getInstance();
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		String id = user.getId();
		int result = dao.delete(bno, id);
		
		
		return result;
	}

}
