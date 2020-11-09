package com.testweb.bbs.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.model.BbsDAO;
import com.testweb.bbs.model.BbsVO;
import com.testweb.util.PageVO;

public class BbsGetListServiceImpl implements BbsService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		BbsDAO dao = BbsDAO.getInstance();
		
		int pageNum = 1;
		int amount = 10;
		
		if(request.getParameter("pageNum") != null || request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		
		}
		
	
		ArrayList<BbsVO> list = dao.getList(pageNum, amount);
		int total = dao.getTotal();
		PageVO pagevo = new PageVO(pageNum, amount, total);
		
		
		if(pagevo != null || list != null) {
			request.setAttribute("list", list);
			request.setAttribute("page", pagevo);
			result = 1;
		} 
		
		return result;
	}

}
