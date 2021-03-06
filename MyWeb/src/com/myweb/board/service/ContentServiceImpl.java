package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class ContentServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
		
		// DAO객체 생성, 상세보기 메서드 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 조회수 증가
		// dao.upHit(bno);  // 지저분해 지니 쿠키를 이용한 방법으로 
			
		
		// 게시글 꺼내오기
		BoardVO vo = dao.getContent(bno);
		
		// request에 vo저장
		request.setAttribute("vo", vo);
		
	}

}
