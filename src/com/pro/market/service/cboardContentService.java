package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.BoardDao;
import com.pro.market.dao.CboardDao;
import com.pro.market.dto.BoardDto;
import com.pro.market.dto.CboardDto;

public class cboardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		CboardDao cDao = CboardDao.getInstance();
		CboardDto cboard = cDao.getCboardContent(cno);
		request.setAttribute("cboard", cboard);
	}

}
