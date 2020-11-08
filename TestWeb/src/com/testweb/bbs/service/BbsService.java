package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BbsService {
	public int execute(HttpServletRequest request, HttpServletResponse response);
}
