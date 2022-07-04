package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.BoardDao;
import com.pro.market.dto.BoardDto;

public class boardModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao bDao = BoardDao.getInstance();
		BoardDto board = bDao.getContent(bno);
		request.setAttribute("board", board);
	}

}
