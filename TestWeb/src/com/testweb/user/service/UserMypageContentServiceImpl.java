package com.testweb.user.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.bbs.model.BbsDAO;
import com.testweb.bbs.model.BbsVO;
import com.testweb.user.model.UserVO;
import com.testweb.util.PageVO;

public class UserMypageContentServiceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int result = 0;
		int pageNum = 1;
		int amount = 10;
		BbsDAO dao = BbsDAO.getInstance();
		
		UserVO vo = (UserVO)session.getAttribute("user");
		String writer = vo.getId();

		if(request.getParameter("pageNum") != null || request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		
		}
		ArrayList<BbsVO> bvo = dao.getMyContent(writer,pageNum,amount);
		int total = dao.getMyTotal(writer);
		PageVO pagevo = new PageVO(pageNum, amount, total);
		
		
		if(vo != null || pagevo != null) {
			request.setAttribute("myCon", bvo);
			request.setAttribute("page", pagevo);
			result = 1;
		}
	
		return result;
	}

}
