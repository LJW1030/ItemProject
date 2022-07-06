package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.MemberDao;
import com.pro.market.dto.MemberDto;

public class findPWService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto fpw = mDao.findPW(mid, mname, memail);
		if(fpw!=null) {
			request.setAttribute("fpw", fpw);
		}else {
			request.setAttribute("findResult", "입력하신 내용과 일치되는 ID가 없습니다");
		}
	}

}
