package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.MemberDao;
import com.pro.market.dto.MemberDto;

public class findIdService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto fid = mDao.findId(mname, memail);
		if(fid!=null) {
			request.setAttribute("fid", fid);
		}else {
			request.setAttribute("findResult", "입력하신 내용과 일치되는 ID가 없습니다");
		}
	}

}
