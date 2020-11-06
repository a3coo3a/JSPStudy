package com.myweb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myweb.user.model.UserDAO;
import com.myweb.user.model.UserVO;
import com.myweb.user.service.UserService;

public class UserDeleteSErviceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String pw = request.getParameter("pw");
		UserVO vo = (UserVO)session.getAttribute("login");
		UserDAO dao = UserDAO.getInstance();
		
		// 1. login 메서드로 유효성 확인
		UserVO result = dao.login(vo.getId(), pw);   // 실패시  null을 반환
				
		if(result != null) {
			dao.delete(vo.getId());
			session.invalidate();
			return 1;
		}else {
			return 0;
		}
		
		
	
	}

}
