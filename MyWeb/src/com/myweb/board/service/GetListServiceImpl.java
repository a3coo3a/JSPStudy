package com.myweb.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class GetListServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardVO> list = dao.getList();  //호출 결과를 리스트에 반환
		
		//화면으로 가져가기 위해  request에 list를 저장
		request.setAttribute("list", list);
		
	
	}

}
