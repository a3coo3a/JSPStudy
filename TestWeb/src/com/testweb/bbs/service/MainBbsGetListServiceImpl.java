package com.testweb.bbs.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.model.BbsDAO;
import com.testweb.bbs.model.BbsVO;

public class MainBbsGetListServiceImpl implements BbsService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		BbsDAO dao = BbsDAO.getInstance();
		
		ArrayList<BbsVO> list = dao.mainbbs();
		
		if(list != null) {
			request.setAttribute("list", list);
			result = 1;
		}
		return result;
	}

}
