package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class UpHitServiceImpl implements BoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
		
		// 화면에서 넘어온 쿠키를 받아서, 현재 조회번호와 같은지 검사해서 실행여부 결정
		Cookie[] arr = request.getCookies();
		boolean flag = true;
		if(arr != null) {
			for (Cookie c : arr) {
				if(c.getName().equals(bno)){  // 300개까지 되지요, 중복클릭을 한거지요
					// 쿠키이름이 게시글 조회 번호와 동일한지 검사
					flag = false;
					break;
				}
			}
		}
		
		if(flag) {  // 중복이 없다면 조회수 업!
			BoardDAO dao = BoardDAO.getInstance();
			dao.upHit(bno);
		}
		// 여기서는 쿠키를 만들어서 리스펀스에 보내고
		// 쿠키는 브라우저에 저장되서 요청이 들어올때마다 자동 저장된걸 보냄 클라이언트에서는 쿠키를 보내고
		
		// 쿠키를 이용해서 마지막 조회된 번호를 클라이언트 측으로 전달
		Cookie cookie = new Cookie(bno, bno);   
		// 쿠키형식 1:1 , 2:2 , 3:3 .....
		
		cookie.setMaxAge(30);
		response.addCookie(cookie);
		
		
	}

}
