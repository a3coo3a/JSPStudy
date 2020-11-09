package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.bbs.model.BbsDAO;
import com.testweb.bbs.model.BbsVO;
import com.testweb.user.model.UserVO;

public class BbsUpdateServiceImpl implements BbsService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BbsDAO dao = BbsDAO.getInstance();
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		String id = user.getId();
		
		BbsVO vo = new BbsVO(Integer.parseInt(bno), writer, title, content, null);
		
		int result = dao.update(vo);
		
		if(result == 1) {
			request.setAttribute("bbsCon", vo);
		}
		
		return result;
	}

}
