package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.BoardDao;

public class boardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao bDao = BoardDao.getInstance();
		System.out.println(bno);
		int result = bDao.deleteBoard(bno);
		if(result == BoardDao.SUCCESS) {
			request.setAttribute("boardResult", "삭제 되었습니다");
		}else {
			request.setAttribute("boardResult", "삭제 되었습니다");
		}
	}

}
