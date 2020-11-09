package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.model.BbsDAO;
import com.testweb.bbs.model.BbsVO;

public class BbsContentServiceImpl implements BbsService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		String bno = request.getParameter("bno");
		
		BbsDAO dao = BbsDAO.getInstance();
		BbsVO vo = dao.getContent(bno);
		if(vo != null) {
			request.setAttribute("bbsCon", vo);
			result = 1;
		}
		return result;
	}

}
