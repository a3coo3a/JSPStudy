package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;

public class UserUpdateServiceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNum1")+"-"+request.getParameter("phoneNum2")+"-"+request.getParameter("phoneNum3");
		String email = request.getParameter("beEmail")+"@"+request.getParameter("afEmail");
		String basicAddress = request.getParameter("basicAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		UserDAO dao = UserDAO.getInstance();
		
		UserVO vo = new UserVO(id, pw, name, phoneNumber, email, basicAddress, detailAddress, null);
		
		int result = dao.update(vo);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("user", vo);
		}
		
		return result;
	}

}
