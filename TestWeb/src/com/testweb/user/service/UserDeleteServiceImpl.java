package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;

public class UserDeleteServiceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("user");
		
		UserDAO dao = UserDAO.getInstance();
		String logPw = vo.getPw();
		int result = 0;
		
		if(pw.equals(logPw)) {
			result = dao.delete(vo.getId());
			if(result == 1) {
				session.invalidate();
			}
		}else {
			result = 0;
		}
		
		return result;
	}

}
