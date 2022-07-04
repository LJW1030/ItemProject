package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.AdminDao;
import com.pro.market.dao.MemberDao;
import com.pro.market.dto.AdminDto;
import com.pro.market.dto.MemberDto;

public class adminLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.loginCheck(aid, apw);
		if(result == AdminDao.LOGIN_SUCCESS) {
			HttpSession session = request.getSession();
			AdminDto admin = aDao.getAdmin(aid);
			session.setAttribute("admin", admin);
		}else {
			request.setAttribute("loginError", "아이디와 비밀번호를 확인하세요");
		}
	}

}
