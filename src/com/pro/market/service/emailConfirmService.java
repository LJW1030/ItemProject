package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.MemberDao;

public class emailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.emailConfirm(memail);
		if(result == MemberDao.NONEXISTENT) {
			request.setAttribute("emailConfirmResult", "사용 가능한 E-MAIL입니다");
		}else {
			request.setAttribute("emailConfirmResult", "<b>중복된 E-MAIL입니다</b>");
		}
	}

}
