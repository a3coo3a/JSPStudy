package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;

public class UserJoinServiceImpl implements UserService {

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
		
		int result = dao.checkId(id);	
		
		if(result == 1) {	// 이미 존재하는 회원
			return 1;
		} else {
			// join 성공시 1
			int resJoin = dao.join(new UserVO(id, pw, name, phoneNumber, email, basicAddress, detailAddress, null));
			if(resJoin == 1) return 0;
			else return 2;  	
		}
		
		
		
		
		
		
		
	}

}
