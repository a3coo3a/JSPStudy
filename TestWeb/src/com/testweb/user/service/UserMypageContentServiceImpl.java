package com.testweb.user.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.bbs.model.BbsDAO;
import com.testweb.bbs.model.BbsVO;
import com.testweb.user.model.UserVO;

public class UserMypageContentServiceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int result = 0;
		
		UserVO vo = (UserVO)session.getAttribute("user");
		String writer = vo.getId();

		BbsDAO dao = BbsDAO.getInstance();
		
		ArrayList<BbsVO> bvo = dao.getMyContent(writer);
		
		if(vo != null) {
			request.setAttribute("myCon", bvo);
			result = 1;
		}
	
		return result;
	}

}
