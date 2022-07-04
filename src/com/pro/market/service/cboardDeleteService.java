package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.CboardDao;

public class cboardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		CboardDao cDao = CboardDao.getInstance();
		int result = cDao.deleteCboard(cno);
		if(result == CboardDao.SUCCESS) {
			request.setAttribute("boardResult", "글이 삭제되었습니다");
		}else {
			request.setAttribute("boardResult", "글이 삭제되지 않았습니다");
		}
	}

}
