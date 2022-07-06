package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.MemberDao;

public class idConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.midConfirm(mid);
		if(result == MemberDao.NONEXISTENT) {
			request.setAttribute("idConfirmResult", "<h4>사용 가능한 ID입니다</h4>");
		}else {
			request.setAttribute("idConfirmResult", "<b>중복된 ID입니다</b>");
		}
	}

}
